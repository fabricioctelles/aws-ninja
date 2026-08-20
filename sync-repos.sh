#!/bin/bash
# sync-repos.sh
# Clone or update all AWS agent skills repositories from repos.md
#
# Usage:
#   ./sync-repos.sh           # Sync all repos (clone or pull)
#   ./sync-repos.sh --status  # Show status of all repos
#   ./sync-repos.sh --clean   # Remove all repos and re-clone

set -e

# Detect script location (works regardless of where it's cloned)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPOS_FILE="$SCRIPT_DIR/repos.md"
AWS_REPOS_DIR="$SCRIPT_DIR"

# Change to script directory (repos will be cloned here)
cd "$SCRIPT_DIR"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Parse repos.md and extract URLs from ```repos block
parse_repos() {
    if [[ ! -f "$REPOS_FILE" ]]; then
        echo -e "${RED}Error: repos.md not found${NC}" >&2
        exit 1
    fi
    
    # Extract URLs between ```repos and ```
    sed -n '/^```repos$/,/^```$/p' "$REPOS_FILE" | grep -E '^https://' || true
}

# Get repo name from URL
get_repo_name() {
    basename "$1"
}

# Show status of all repos
show_status() {
    echo -e "${BLUE}AWS Agent Skills Repositories Status${NC}"
    echo "======================================"
    echo -e "Location: ${YELLOW}$AWS_REPOS_DIR${NC}"
    echo -e "Source:   ${YELLOW}$REPOS_FILE${NC}"
    echo ""
    
    local total=0
    local cloned=0
    local missing=0
    
    while IFS= read -r url; do
        [[ -z "$url" ]] && continue
        local name=$(get_repo_name "$url")
        ((total++))
        
        if [[ -d "$name/.git" ]]; then
            ((cloned++))
            local branch=$(cd "$name" && git branch --show-current 2>/dev/null || echo "unknown")
            local commit=$(cd "$name" && git log -1 --format="%h %s" 2>/dev/null | cut -c1-60)
            local date=$(cd "$name" && git log -1 --format="%cr" 2>/dev/null || echo "unknown")
            echo -e "${GREEN}✓${NC} $name"
            echo "  Branch: $branch | Last commit: $date"
            echo "  $commit"
        else
            ((missing++))
            echo -e "${RED}✗${NC} $name (not cloned)"
            echo "  $url"
        fi
        echo ""
    done < <(parse_repos)
    
    echo "======================================"
    echo -e "Total: $total | Cloned: ${GREEN}$cloned${NC} | Missing: ${RED}$missing${NC}"
}

# Clone a single repo
clone_repo() {
    local url="$1"
    local name=$(get_repo_name "$url")
    
    echo -e "${BLUE}Cloning $name...${NC}"
    if gh repo clone "$url" "$name" 2>/dev/null; then
        echo -e "  ${GREEN}✓${NC} Cloned successfully"
        return 0
    elif git clone "$url" "$name" 2>/dev/null; then
        echo -e "  ${GREEN}✓${NC} Cloned successfully (via git)"
        return 0
    else
        echo -e "  ${RED}✗${NC} Failed to clone"
        return 1
    fi
}

# Update a single repo
update_repo() {
    local name="$1"
    
    echo -e "${BLUE}Updating $name...${NC}"
    cd "$name"
    
    # Stash any local changes
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        echo -e "  ${YELLOW}!${NC} Stashing local changes"
        git stash -q
    fi
    
    # Pull latest
    if git pull -q 2>/dev/null; then
        local commit=$(git log -1 --format="%h %s" | cut -c1-50)
        echo -e "  ${GREEN}✓${NC} Updated: $commit"
    else
        echo -e "  ${RED}✗${NC} Failed to update"
    fi
    
    cd "$SCRIPT_DIR"
}

# Sync all repos (clone or update)
sync_all() {
    echo -e "${BLUE}Syncing AWS Agent Skills Repositories${NC}"
    echo "======================================="
    echo -e "Location: ${YELLOW}$AWS_REPOS_DIR${NC}"
    echo -e "Source:   ${YELLOW}$REPOS_FILE${NC}"
    echo ""
    
    local cloned=0
    local updated=0
    local failed=0
    
    while IFS= read -r url; do
        [[ -z "$url" ]] && continue
        local name=$(get_repo_name "$url")
        
        if [[ -d "$name/.git" ]]; then
            update_repo "$name" && ((updated++)) || ((failed++))
        else
            clone_repo "$url" && ((cloned++)) || ((failed++))
        fi
    done < <(parse_repos)
    
    echo ""
    echo "======================================="
    echo -e "Cloned: ${GREEN}$cloned${NC} | Updated: ${GREEN}$updated${NC} | Failed: ${RED}$failed${NC}"
    
    # Count skills
    local skill_count=$(find "$AWS_REPOS_DIR" -path "*/skills/*" -name "SKILL.md" ! -path "*/misc/*" ! -path "*/evals/*" ! -path "*/aws-ninja/*" 2>/dev/null | wc -l | tr -d ' ')
    echo -e "Total skills available: ${YELLOW}$skill_count${NC}"
    echo ""
    echo -e "Skills location: ${BLUE}$AWS_REPOS_DIR${NC}"
}

# Clean and re-clone all repos
clean_all() {
    echo -e "${RED}WARNING: This will delete all cloned repositories!${NC}"
    read -p "Are you sure? (y/N) " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
    
    while IFS= read -r url; do
        [[ -z "$url" ]] && continue
        local name=$(get_repo_name "$url")
        if [[ -d "$name" ]]; then
            echo -e "Removing $name..."
            rm -rf "$name"
        fi
    done < <(parse_repos)
    
    echo ""
    sync_all
}

# List repos from repos.md
list_repos() {
    echo -e "${BLUE}Repositories in repos.md${NC}"
    echo "========================="
    while IFS= read -r url; do
        [[ -z "$url" ]] && continue
        local name=$(get_repo_name "$url")
        echo "  $name"
        echo "    $url"
    done < <(parse_repos)
}

# Main
case "${1:-}" in
    --status|-s)
        show_status
        ;;
    --clean|-c)
        clean_all
        ;;
    --list|-l)
        list_repos
        ;;
    --help|-h)
        echo "Usage: $0 [options]"
        echo ""
        echo "Options:"
        echo "  (none)        Sync all repos (clone missing, update existing)"
        echo "  --status, -s  Show status of all repositories"
        echo "  --list, -l    List repositories from repos.md"
        echo "  --clean, -c   Remove all repos and re-clone from scratch"
        echo "  --help, -h    Show this help"
        echo ""
        echo "Repository source: repos.md"
        echo "Add new repos by adding URLs to the \`\`\`repos block in repos.md"
        ;;
    *)
        sync_all
        ;;
esac
