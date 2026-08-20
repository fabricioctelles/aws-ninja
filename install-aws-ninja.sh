#!/bin/bash
# install-aws-ninja.sh
# Installs the aws-ninja skill to all supported AI coding agents
#
# Usage:
#   ./install-aws-ninja.sh           # Install to all detected agents
#   ./install-aws-ninja.sh --list    # List agents and their paths
#   ./install-aws-ninja.sh --global  # Install to global paths only
#   ./install-aws-ninja.sh --project # Install to project paths only
#   ./install-aws-ninja.sh claude-code cursor kiro-cli  # Install to specific agents

set -e

# Detect script location (works regardless of where it's cloned)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_NAME="aws-ninja"
SKILL_SOURCE="$SCRIPT_DIR/aws-ninja"

# AWS repos are cloned into the same directory as this script
AWS_REPOS_DIR="$SCRIPT_DIR"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Agent configurations: agent_id|global_path|project_path
# Based on https://github.com/vercel-labs/skills (skills.sh)
declare -a AGENTS=(
    # Major agents
    "claude-code|~/.claude/skills|.claude/skills"
    "kiro-cli|~/.kiro/skills|.kiro/skills"
    "cursor|~/.cursor/skills|.agents/skills"
    "codex|~/.codex/skills|.agents/skills"
    "opencode|~/.config/opencode/skills|.agents/skills"
    "windsurf|~/.codeium/windsurf/skills|.windsurf/skills"
    "github-copilot|~/.copilot/skills|.agents/skills"
    "gemini-cli|~/.gemini/skills|.agents/skills"
    "antigravity|~/.gemini/antigravity/skills|.agents/skills"
    "cline|~/.agents/skills|.agents/skills"
    "roo|~/.roo/skills|.roo/skills"
    "amp|~/.config/agents/skills|.agents/skills"
    "openclaw|~/.openclaw/skills|skills"
    "continue|~/.continue/skills|.continue/skills"
    "goose|~/.config/goose/skills|.goose/skills"
    "pi|~/.pi/agent/skills|.pi/skills"
    "junie|~/.junie/skills|.junie/skills"
    "trae|~/.trae/skills|.trae/skills"
    "qoder|~/.qoder/skills|.qoder/skills"
    "qwen-code|~/.qwen/skills|.qwen/skills"
    "zencoder|~/.zencoder/skills|.zencoder/skills"
    "firebender|~/.firebender/skills|.agents/skills"
    "cortex|~/.snowflake/cortex/skills|.cortex/skills"
    "openhands|~/.openhands/skills|.openhands/skills"
    "devin|~/.config/devin/skills|.devin/skills"
    "tabnine-cli|~/.tabnine/agent/skills|.tabnine/agent/skills"
    "kilo|~/.kilocode/skills|.kilocode/skills"
    "augment|~/.augment/skills|.augment/skills"
    "bob|~/.bob/skills|.bob/skills"
    "lingma|~/.lingma/skills|.lingma/skills"
    "minimax-code|~/.minimax/skills|.minimax/skills"
    "mistral-vibe|~/.vibe/skills|.vibe/skills"
    "grok|~/.grok/skills|.grok/skills"
    "droid|~/.factory/skills|.factory/skills"
    "forge|~/.forge/skills|.forge/skills"
    "neovate|~/.neovate/skills|.neovate/skills"
    "pochi|~/.pochi/skills|.pochi/skills"
)

# Expand ~ in paths
expand_path() {
    echo "${1/#\~/$HOME}"
}

# Check if a directory exists (for agent detection)
agent_installed() {
    local global_path=$(expand_path "$1")
    local parent_dir=$(dirname "$global_path")
    [[ -d "$parent_dir" ]] || [[ -d "$global_path" ]]
}

# List all agents and their paths
list_agents() {
    echo -e "${BLUE}Supported AI Coding Agents${NC}"
    echo "=========================="
    printf "%-20s %-45s %s\n" "Agent" "Global Path" "Project Path"
    printf "%-20s %-45s %s\n" "-----" "-----------" "------------"
    
    for agent_config in "${AGENTS[@]}"; do
        IFS='|' read -r agent_id global_path project_path <<< "$agent_config"
        local expanded=$(expand_path "$global_path")
        local status=""
        if [[ -d "$expanded" ]] || [[ -d "$(dirname $expanded)" ]]; then
            status="${GREEN}[detected]${NC}"
        fi
        printf "%-20s %-45s %s %b\n" "$agent_id" "$global_path" "$project_path" "$status"
    done
}

# Install skill to a path
install_skill() {
    local target_dir="$1"
    local method="$2"  # symlink or copy
    
    target_dir=$(expand_path "$target_dir")
    local skill_target="$target_dir/$SKILL_NAME"
    
    # Create parent directory if needed
    mkdir -p "$target_dir"
    
    # Remove existing if present
    if [[ -L "$skill_target" ]] || [[ -d "$skill_target" ]]; then
        rm -rf "$skill_target"
    fi
    
    if [[ "$method" == "symlink" ]]; then
        ln -s "$SKILL_SOURCE" "$skill_target"
        echo -e "  ${GREEN}✓${NC} Symlinked to $skill_target"
    else
        cp -r "$SKILL_SOURCE" "$skill_target"
        echo -e "  ${GREEN}✓${NC} Copied to $skill_target"
    fi
}

# Detect which agents are installed
detect_agents() {
    local detected=()
    for agent_config in "${AGENTS[@]}"; do
        IFS='|' read -r agent_id global_path project_path <<< "$agent_config"
        if agent_installed "$global_path"; then
            detected+=("$agent_id")
        fi
    done
    echo "${detected[@]}"
}

# Get agent config by ID
get_agent_config() {
    local search_id="$1"
    for agent_config in "${AGENTS[@]}"; do
        IFS='|' read -r agent_id global_path project_path <<< "$agent_config"
        if [[ "$agent_id" == "$search_id" ]]; then
            echo "$agent_config"
            return 0
        fi
    done
    return 1
}

# Main installation
main() {
    local scope="both"  # global, project, or both
    local target_agents=()
    local method="copy"
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --list|-l)
                list_agents
                exit 0
                ;;
            --global|-g)
                scope="global"
                shift
                ;;
            --project|-p)
                scope="project"
                shift
                ;;
            --symlink)
                method="symlink"
                shift
                ;;
            --help|-h)
                echo "Usage: $0 [options] [agents...]"
                echo ""
                echo "Options:"
                echo "  --list, -l      List all supported agents and their paths"
                echo "  --global, -g    Install to global paths only"
                echo "  --project, -p   Install to project paths only"
                echo "  --symlink          Symlink instead of copying files"
                echo "  --help, -h      Show this help"
                echo ""
                echo "Examples:"
                echo "  $0                          # Install to all detected agents"
                echo "  $0 claude-code cursor       # Install to specific agents"
                echo "  $0 --global                 # Global install only"
                exit 0
                ;;
            -*)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
            *)
                target_agents+=("$1")
                shift
                ;;
        esac
    done
    
    # Check source exists
    if [[ ! -d "$SKILL_SOURCE" ]]; then
        echo -e "${RED}Error: Skill source not found at $SKILL_SOURCE${NC}"
        echo "Please ensure aws-ninja skill exists in ~/.kiro/skills/"
        exit 1
    fi
    
    echo -e "${BLUE}AWS Ninja Skill Installer${NC}"
    echo "========================="
    echo ""
    echo -e "Source: ${YELLOW}$SKILL_SOURCE${NC}"
    echo -e "Method: ${YELLOW}$method${NC}"
    echo ""
    
    # If no specific agents requested, detect installed ones
    if [[ ${#target_agents[@]} -eq 0 ]]; then
        read -ra target_agents <<< "$(detect_agents)"
        if [[ ${#target_agents[@]} -eq 0 ]]; then
            echo -e "${YELLOW}No agents detected. Installing to common agents...${NC}"
            target_agents=("claude-code" "kiro-cli" "cursor" "codex" "opencode" "windsurf" "github-copilot")
        else
            echo -e "Detected agents: ${GREEN}${target_agents[*]}${NC}"
        fi
    fi
    
    echo ""
    
    # Install to each agent
    local installed=0
    for agent_id in "${target_agents[@]}"; do
        local config=$(get_agent_config "$agent_id")
        if [[ -z "$config" ]]; then
            echo -e "${YELLOW}⚠ Unknown agent: $agent_id (skipping)${NC}"
            continue
        fi
        
        IFS='|' read -r _ global_path project_path <<< "$config"
        
        echo -e "${BLUE}Installing to $agent_id${NC}"
        
        if [[ "$scope" == "global" ]] || [[ "$scope" == "both" ]]; then
            install_skill "$global_path" "$method"
            ((installed++))
        fi
        
        if [[ "$scope" == "project" ]] || [[ "$scope" == "both" ]]; then
            if [[ -d ".git" ]] || [[ "$scope" == "project" ]]; then
                install_skill "$project_path" "$method"
                ((installed++))
            fi
        fi
    done
    
    echo ""
    echo -e "${GREEN}Done!${NC} Installed aws-ninja to $installed locations."
    echo ""
    echo -e "The skill orchestrates 217+ AWS skills from: ${YELLOW}$AWS_REPOS_DIR${NC}"
    echo "Trigger words: AWS, EKS, Lambda, DynamoDB, CDK, security, cost, etc."
    echo ""
    echo -e "Run ${BLUE}./sync-repos.sh${NC} to clone/update the AWS skill repositories."
}

main "$@"
