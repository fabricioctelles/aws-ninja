# sync-repos.ps1
# Clone or update all AWS agent skills repositories from repos.md
#
# Usage:
#   .\sync-repos.ps1            # Sync all repos (clone or pull)
#   .\sync-repos.ps1 -Status    # Show status of all repos
#   .\sync-repos.ps1 -List      # List repos from repos.md
#   .\sync-repos.ps1 -Clean     # Remove all repos and re-clone
#   .\sync-repos.ps1 -Help      # Show help

param(
    [switch]$Status,
    [switch]$List,
    [switch]$Clean,
    [switch]$Help
)

$ErrorActionPreference = "Stop"

# Detect script location (works regardless of where it's cloned)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ReposFile = Join-Path $ScriptDir "repos.md"
$AwsReposDir = $ScriptDir

# Change to script directory
Set-Location $ScriptDir

# Colors for output
function Write-Color {
    param([string]$Text, [string]$Color = "White", [switch]$NoNewline)
    if ($NoNewline) {
        Write-Host $Text -ForegroundColor $Color -NoNewline
    } else {
        Write-Host $Text -ForegroundColor $Color
    }
}

# Parse repos.md and extract URLs from ```repos block
function Get-RepoUrls {
    if (-not (Test-Path $ReposFile)) {
        Write-Color "Error: repos.md not found at $ReposFile" "Red"
        exit 1
    }
    
    $content = Get-Content $ReposFile -Raw
    $urls = @()
    
    # Match content between ```repos and ```
    if ($content -match '(?s)```repos\s*\n(.*?)\n```') {
        $block = $Matches[1]
        $lines = $block -split "`n"
        foreach ($line in $lines) {
            $line = $line.Trim()
            if ($line -match '^https://') {
                $urls += $line
            }
        }
    }
    
    return $urls
}

# Get repo name from URL
function Get-RepoName {
    param([string]$Url)
    return [System.IO.Path]::GetFileName($Url)
}

# Show help
function Show-Help {
    Write-Host @"
AWS Agent Skills Repository Sync (PowerShell)

Usage: .\sync-repos.ps1 [options]

Options:
  (none)      Sync all repos (clone missing, update existing)
  -Status     Show status of all repositories
  -List       List repositories from repos.md
  -Clean      Remove all repos and re-clone from scratch
  -Help       Show this help

Repository source: repos.md
Add new repos by adding URLs to the ```repos block in repos.md
"@
}

# Show status of all repos
function Show-Status {
    Write-Color "AWS Agent Skills Repositories Status" "Cyan"
    Write-Host "======================================"
    Write-Host "Location: " -NoNewline
    Write-Color $AwsReposDir "Yellow"
    Write-Host "Source:   " -NoNewline
    Write-Color $ReposFile "Yellow"
    Write-Host ""
    
    $total = 0
    $cloned = 0
    $missing = 0
    
    $urls = Get-RepoUrls
    foreach ($url in $urls) {
        if ([string]::IsNullOrWhiteSpace($url)) { continue }
        
        $name = Get-RepoName $url
        $total++
        $repoPath = Join-Path $ScriptDir $name
        $gitPath = Join-Path $repoPath ".git"
        
        if (Test-Path $gitPath) {
            $cloned++
            Push-Location $repoPath
            try {
                $branch = git branch --show-current 2>$null
                if (-not $branch) { $branch = "unknown" }
                $commit = git log -1 --format="%h %s" 2>$null
                if ($commit -and $commit.Length -gt 60) {
                    $commit = $commit.Substring(0, 60)
                }
                $date = git log -1 --format="%cr" 2>$null
                if (-not $date) { $date = "unknown" }
                
                Write-Color "OK " "Green" -NoNewline
                Write-Host $name
                Write-Host "  Branch: $branch | Last commit: $date"
                Write-Host "  $commit"
            }
            finally {
                Pop-Location
            }
        }
        else {
            $missing++
            Write-Color "X " "Red" -NoNewline
            Write-Host "$name (not cloned)"
            Write-Host "  $url"
        }
        Write-Host ""
    }
    
    Write-Host "======================================"
    Write-Host "Total: $total | Cloned: " -NoNewline
    Write-Color "$cloned" "Green" -NoNewline
    Write-Host " | Missing: " -NoNewline
    Write-Color "$missing" "Red"
}

# Clone a single repo
function Clone-Repo {
    param([string]$Url)
    
    $name = Get-RepoName $Url
    Write-Color "Cloning $name..." "Cyan"
    
    # Try gh first, then git
    $cloned = $false
    
    # Check if gh is available
    $ghAvailable = Get-Command gh -ErrorAction SilentlyContinue
    if ($ghAvailable) {
        try {
            $output = & gh repo clone $Url $name 2>&1
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  " -NoNewline
                Write-Color "OK" "Green" -NoNewline
                Write-Host " Cloned successfully"
                return $true
            }
        }
        catch { }
    }
    
    # Fall back to git
    try {
        $output = & git clone $Url $name 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  " -NoNewline
            Write-Color "OK" "Green" -NoNewline
            Write-Host " Cloned successfully (via git)"
            return $true
        }
    }
    catch { }
    
    Write-Host "  " -NoNewline
    Write-Color "X" "Red" -NoNewline
    Write-Host " Failed to clone"
    return $false
}

# Update a single repo
function Update-Repo {
    param([string]$Name)
    
    Write-Color "Updating $Name..." "Cyan"
    
    $repoPath = Join-Path $ScriptDir $Name
    Push-Location $repoPath
    
    try {
        # Check for local changes
        $status = git status --porcelain 2>$null
        if ($status) {
            Write-Host "  " -NoNewline
            Write-Color "!" "Yellow" -NoNewline
            Write-Host " Stashing local changes"
            git stash -q 2>$null
        }
        
        # Pull latest
        $output = git pull -q 2>&1
        if ($LASTEXITCODE -eq 0) {
            $commit = git log -1 --format="%h %s" 2>$null
            if ($commit -and $commit.Length -gt 50) {
                $commit = $commit.Substring(0, 50)
            }
            Write-Host "  " -NoNewline
            Write-Color "OK" "Green" -NoNewline
            Write-Host " Updated: $commit"
            return $true
        }
        else {
            Write-Host "  " -NoNewline
            Write-Color "X" "Red" -NoNewline
            Write-Host " Failed to update"
            return $false
        }
    }
    finally {
        Pop-Location
    }
}

# Sync all repos
function Sync-All {
    Write-Color "Syncing AWS Agent Skills Repositories" "Cyan"
    Write-Host "======================================="
    Write-Host "Location: " -NoNewline
    Write-Color $AwsReposDir "Yellow"
    Write-Host "Source:   " -NoNewline
    Write-Color $ReposFile "Yellow"
    Write-Host ""
    
    $cloned = 0
    $updated = 0
    $failed = 0
    
    $urls = Get-RepoUrls
    foreach ($url in $urls) {
        if ([string]::IsNullOrWhiteSpace($url)) { continue }
        
        $name = Get-RepoName $url
        $repoPath = Join-Path $ScriptDir $name
        $gitPath = Join-Path $repoPath ".git"
        
        if (Test-Path $gitPath) {
            if (Update-Repo $name) { $updated++ } else { $failed++ }
        }
        else {
            if (Clone-Repo $url) { $cloned++ } else { $failed++ }
        }
    }
    
    Write-Host ""
    Write-Host "======================================="
    Write-Host "Cloned: " -NoNewline
    Write-Color "$cloned" "Green" -NoNewline
    Write-Host " | Updated: " -NoNewline
    Write-Color "$updated" "Green" -NoNewline
    Write-Host " | Failed: " -NoNewline
    Write-Color "$failed" "Red"
    
    # Count skills
    $skillCount = (Get-ChildItem -Path $AwsReposDir -Recurse -Filter "SKILL.md" -File -ErrorAction SilentlyContinue |
        Where-Object { 
            $_.FullName -like "*\skills\*" -and 
            $_.FullName -notlike "*\misc\*" -and 
            $_.FullName -notlike "*\evals\*" -and
            $_.FullName -notlike "*\aws-ninja\*"
        }).Count
    
    Write-Host "Total skills available: " -NoNewline
    Write-Color "$skillCount" "Yellow"
    Write-Host ""
    Write-Host "Skills location: " -NoNewline
    Write-Color $AwsReposDir "Cyan"
}

# List repos from repos.md
function Show-List {
    Write-Color "Repositories in repos.md" "Cyan"
    Write-Host "========================="
    
    $urls = Get-RepoUrls
    foreach ($url in $urls) {
        if ([string]::IsNullOrWhiteSpace($url)) { continue }
        
        $name = Get-RepoName $url
        Write-Host "  $name"
        Write-Host "    $url"
    }
}

# Clean and re-clone all repos
function Clean-All {
    Write-Color "WARNING: This will delete all cloned repositories!" "Red"
    $confirm = Read-Host "Are you sure? (y/N)"
    
    if ($confirm -ne "y" -and $confirm -ne "Y") {
        Write-Host "Aborted."
        exit 0
    }
    
    $urls = Get-RepoUrls
    foreach ($url in $urls) {
        if ([string]::IsNullOrWhiteSpace($url)) { continue }
        
        $name = Get-RepoName $url
        $repoPath = Join-Path $ScriptDir $name
        
        if (Test-Path $repoPath) {
            Write-Host "Removing $name..."
            Remove-Item -Path $repoPath -Recurse -Force
        }
    }
    
    Write-Host ""
    Sync-All
}

# Main execution
if ($Help) {
    Show-Help
    exit 0
}

if ($Status) {
    Show-Status
    exit 0
}

if ($List) {
    Show-List
    exit 0
}

if ($Clean) {
    Clean-All
    exit 0
}

# Default: sync all
Sync-All
