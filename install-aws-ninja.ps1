# install-aws-ninja.ps1
# Installs the aws-ninja skill to all supported AI coding agents on Windows
#
# Usage:
#   .\install-aws-ninja.ps1                         # Install to all detected agents
#   .\install-aws-ninja.ps1 -List                   # List agents and their paths
#   .\install-aws-ninja.ps1 -Global                 # Install to global paths only
#   .\install-aws-ninja.ps1 -Project                # Install to project paths only
#   .\install-aws-ninja.ps1 -Agents claude-code,cursor,kiro-cli  # Install to specific agents

param(
    [switch]$List,
    [switch]$Global,
    [switch]$Project,
    [switch]$Symlink,
    [switch]$Help,
    [string[]]$Agents
)

$ErrorActionPreference = "Stop"

# Detect script location
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillName = "aws-ninja"
$SkillSource = Join-Path $ScriptDir "aws-ninja"
$AwsReposDir = $ScriptDir

# Colors for output
function Write-Color {
    param([string]$Text, [string]$Color = "White")
    Write-Host $Text -ForegroundColor $Color
}

# Agent configurations: agent_id, global_path, project_path
$AgentConfigs = @(
    @{ Id = "claude-code"; GlobalPath = "$env:USERPROFILE\.claude\skills"; ProjectPath = ".claude\skills" }
    @{ Id = "kiro-cli"; GlobalPath = "$env:USERPROFILE\.kiro\skills"; ProjectPath = ".kiro\skills" }
    @{ Id = "cursor"; GlobalPath = "$env:USERPROFILE\.cursor\skills"; ProjectPath = ".agents\skills" }
    @{ Id = "codex"; GlobalPath = "$env:USERPROFILE\.codex\skills"; ProjectPath = ".agents\skills" }
    @{ Id = "opencode"; GlobalPath = "$env:APPDATA\opencode\skills"; ProjectPath = ".agents\skills" }
    @{ Id = "windsurf"; GlobalPath = "$env:USERPROFILE\.codeium\windsurf\skills"; ProjectPath = ".windsurf\skills" }
    @{ Id = "github-copilot"; GlobalPath = "$env:USERPROFILE\.copilot\skills"; ProjectPath = ".agents\skills" }
    @{ Id = "gemini-cli"; GlobalPath = "$env:USERPROFILE\.gemini\skills"; ProjectPath = ".agents\skills" }
    @{ Id = "antigravity"; GlobalPath = "$env:USERPROFILE\.gemini\antigravity\skills"; ProjectPath = ".agents\skills" }
    @{ Id = "cline"; GlobalPath = "$env:USERPROFILE\.agents\skills"; ProjectPath = ".agents\skills" }
    @{ Id = "roo"; GlobalPath = "$env:USERPROFILE\.roo\skills"; ProjectPath = ".roo\skills" }
    @{ Id = "amp"; GlobalPath = "$env:APPDATA\agents\skills"; ProjectPath = ".agents\skills" }
    @{ Id = "openclaw"; GlobalPath = "$env:USERPROFILE\.openclaw\skills"; ProjectPath = "skills" }
    @{ Id = "continue"; GlobalPath = "$env:USERPROFILE\.continue\skills"; ProjectPath = ".continue\skills" }
    @{ Id = "goose"; GlobalPath = "$env:APPDATA\goose\skills"; ProjectPath = ".goose\skills" }
    @{ Id = "pi"; GlobalPath = "$env:USERPROFILE\.pi\agent\skills"; ProjectPath = ".pi\skills" }
    @{ Id = "junie"; GlobalPath = "$env:USERPROFILE\.junie\skills"; ProjectPath = ".junie\skills" }
    @{ Id = "trae"; GlobalPath = "$env:USERPROFILE\.trae\skills"; ProjectPath = ".trae\skills" }
    @{ Id = "qoder"; GlobalPath = "$env:USERPROFILE\.qoder\skills"; ProjectPath = ".qoder\skills" }
    @{ Id = "qwen-code"; GlobalPath = "$env:USERPROFILE\.qwen\skills"; ProjectPath = ".qwen\skills" }
    @{ Id = "zencoder"; GlobalPath = "$env:USERPROFILE\.zencoder\skills"; ProjectPath = ".zencoder\skills" }
    @{ Id = "firebender"; GlobalPath = "$env:USERPROFILE\.firebender\skills"; ProjectPath = ".agents\skills" }
    @{ Id = "cortex"; GlobalPath = "$env:USERPROFILE\.snowflake\cortex\skills"; ProjectPath = ".cortex\skills" }
    @{ Id = "openhands"; GlobalPath = "$env:USERPROFILE\.openhands\skills"; ProjectPath = ".openhands\skills" }
    @{ Id = "devin"; GlobalPath = "$env:APPDATA\devin\skills"; ProjectPath = ".devin\skills" }
    @{ Id = "tabnine-cli"; GlobalPath = "$env:USERPROFILE\.tabnine\agent\skills"; ProjectPath = ".tabnine\agent\skills" }
    @{ Id = "kilo"; GlobalPath = "$env:USERPROFILE\.kilocode\skills"; ProjectPath = ".kilocode\skills" }
    @{ Id = "augment"; GlobalPath = "$env:USERPROFILE\.augment\skills"; ProjectPath = ".augment\skills" }
    @{ Id = "bob"; GlobalPath = "$env:USERPROFILE\.bob\skills"; ProjectPath = ".bob\skills" }
    @{ Id = "lingma"; GlobalPath = "$env:USERPROFILE\.lingma\skills"; ProjectPath = ".lingma\skills" }
    @{ Id = "minimax-code"; GlobalPath = "$env:USERPROFILE\.minimax\skills"; ProjectPath = ".minimax\skills" }
    @{ Id = "mistral-vibe"; GlobalPath = "$env:USERPROFILE\.vibe\skills"; ProjectPath = ".vibe\skills" }
    @{ Id = "grok"; GlobalPath = "$env:USERPROFILE\.grok\skills"; ProjectPath = ".grok\skills" }
    @{ Id = "droid"; GlobalPath = "$env:USERPROFILE\.factory\skills"; ProjectPath = ".factory\skills" }
    @{ Id = "forge"; GlobalPath = "$env:USERPROFILE\.forge\skills"; ProjectPath = ".forge\skills" }
    @{ Id = "neovate"; GlobalPath = "$env:USERPROFILE\.neovate\skills"; ProjectPath = ".neovate\skills" }
    @{ Id = "pochi"; GlobalPath = "$env:USERPROFILE\.pochi\skills"; ProjectPath = ".pochi\skills" }
)

function Show-Help {
    Write-Host @"
AWS Ninja Skill Installer (PowerShell)

Usage: .\install-aws-ninja.ps1 [options]

Options:
  -List              List all supported agents and their paths
  -Global            Install to global paths only
  -Project           Install to project paths only
  -Symlink           Create symbolic links instead of copying (requires admin)
  -Agents <list>     Install to specific agents (comma-separated)
  -Help              Show this help

Examples:
  .\install-aws-ninja.ps1                              # Install to all detected agents
  .\install-aws-ninja.ps1 -Agents claude-code,cursor   # Install to specific agents
  .\install-aws-ninja.ps1 -Global                      # Global install only
  .\install-aws-ninja.ps1 -Symlink -Global             # Symlink (requires admin)
"@
}

function Test-AgentInstalled {
    param([string]$GlobalPath)
    $parentDir = Split-Path -Parent $GlobalPath
    return (Test-Path $parentDir) -or (Test-Path $GlobalPath)
}

function Show-AgentList {
    Write-Color "Supported AI Coding Agents" "Cyan"
    Write-Host "=========================="
    Write-Host ("{0,-20} {1,-50} {2}" -f "Agent", "Global Path", "Project Path")
    Write-Host ("{0,-20} {1,-50} {2}" -f "-----", "-----------", "------------")
    
    foreach ($agent in $AgentConfigs) {
        $status = ""
        if (Test-AgentInstalled $agent.GlobalPath) {
            $status = "[detected]"
        }
        $statusColor = if ($status) { "Green" } else { "White" }
        Write-Host ("{0,-20} {1,-50} {2} " -f $agent.Id, $agent.GlobalPath, $agent.ProjectPath) -NoNewline
        Write-Color $status $statusColor
    }
}

function Install-Skill {
    param(
        [string]$TargetDir,
        [bool]$UseSymlink
    )
    
    $skillTarget = Join-Path $TargetDir $SkillName
    
    # Create parent directory if needed
    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }
    
    # Remove existing if present
    if (Test-Path $skillTarget) {
        Remove-Item -Path $skillTarget -Recurse -Force
    }
    
    if ($UseSymlink) {
        # Requires admin privileges on Windows
        try {
            New-Item -ItemType SymbolicLink -Path $skillTarget -Target $SkillSource -Force | Out-Null
            Write-Host "  " -NoNewline
            Write-Color "✓" "Green" -NoNewline
            Write-Host " Symlinked to $skillTarget"
        }
        catch {
            Write-Host "  " -NoNewline
            Write-Color "✗" "Red" -NoNewline
            Write-Host " Symlink failed (run as admin). Falling back to copy..."
            Copy-Item -Path $SkillSource -Destination $skillTarget -Recurse -Force
            Write-Host "  " -NoNewline
            Write-Color "✓" "Green" -NoNewline
            Write-Host " Copied to $skillTarget"
        }
    }
    else {
        Copy-Item -Path $SkillSource -Destination $skillTarget -Recurse -Force
        Write-Host "  " -NoNewline
        Write-Color "✓" "Green" -NoNewline
        Write-Host " Copied to $skillTarget"
    }
}

function Get-DetectedAgents {
    $detected = @()
    foreach ($agent in $AgentConfigs) {
        if (Test-AgentInstalled $agent.GlobalPath) {
            $detected += $agent.Id
        }
    }
    return $detected
}

function Get-AgentConfig {
    param([string]$AgentId)
    return $AgentConfigs | Where-Object { $_.Id -eq $AgentId }
}

# Main execution
if ($Help) {
    Show-Help
    exit 0
}

if ($List) {
    Show-AgentList
    exit 0
}

# Check source exists
if (-not (Test-Path $SkillSource)) {
    Write-Color "Error: Skill source not found at $SkillSource" "Red"
    Write-Host "Please ensure aws-ninja skill folder exists."
    exit 1
}

Write-Color "AWS Ninja Skill Installer (PowerShell)" "Cyan"
Write-Host "======================================="
Write-Host ""
Write-Host "Source: " -NoNewline
Write-Color $SkillSource "Yellow"
Write-Host "Method: " -NoNewline
Write-Color $(if ($Symlink) { "symlink" } else { "copy" }) "Yellow"
Write-Host ""

# Determine scope
$scope = "both"
if ($Global -and -not $Project) { $scope = "global" }
if ($Project -and -not $Global) { $scope = "project" }

# Determine target agents
$targetAgents = @()
if ($Agents -and $Agents.Count -gt 0) {
    $targetAgents = $Agents
}
else {
    $targetAgents = Get-DetectedAgents
    if ($targetAgents.Count -eq 0) {
        Write-Color "No agents detected. Installing to common agents..." "Yellow"
        $targetAgents = @("claude-code", "kiro-cli", "cursor", "codex", "opencode", "windsurf", "github-copilot")
    }
    else {
        Write-Host "Detected agents: " -NoNewline
        Write-Color ($targetAgents -join ", ") "Green"
    }
}

Write-Host ""

# Install to each agent
$installed = 0
foreach ($agentId in $targetAgents) {
    $config = Get-AgentConfig $agentId
    if (-not $config) {
        Write-Color "⚠ Unknown agent: $agentId (skipping)" "Yellow"
        continue
    }
    
    Write-Color "Installing to $agentId" "Cyan"
    
    if ($scope -eq "global" -or $scope -eq "both") {
        Install-Skill -TargetDir $config.GlobalPath -UseSymlink $Symlink
        $installed++
    }
    
    if ($scope -eq "project" -or $scope -eq "both") {
        if ((Test-Path ".git") -or $scope -eq "project") {
            Install-Skill -TargetDir $config.ProjectPath -UseSymlink $Symlink
            $installed++
        }
    }
}

Write-Host ""
Write-Color "Done!" "Green" -NoNewline
Write-Host " Installed aws-ninja to $installed locations."
Write-Host ""
Write-Host "The skill orchestrates 217+ AWS skills from: " -NoNewline
Write-Color $AwsReposDir "Yellow"
Write-Host "Trigger words: AWS, EKS, Lambda, DynamoDB, CDK, security, cost, etc."
Write-Host ""
Write-Host "Run " -NoNewline
Write-Color ".\sync-repos.ps1" "Cyan" -NoNewline
Write-Host " to clone/update the AWS skill repositories."
