#!/bin/bash

# Claude Code Git Flow Command System Installer
# Version: 1.0.0
# Description: Installs the git flow command system for Claude Code

set -euo pipefail

# Constants
readonly SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly VERSION="1.0.0"

# Installation paths
readonly CLAUDE_DIR="${HOME}/.claude"
readonly COMMANDS_DIR="${CLAUDE_DIR}/commands"
readonly AGENTS_DIR="${CLAUDE_DIR}/agents"
readonly TEMPLATES_DIR="${CLAUDE_DIR}/templates"

# Color codes
readonly COLOR_RED='\033[0;31m'
readonly COLOR_GREEN='\033[0;32m'
readonly COLOR_YELLOW='\033[1;33m'
readonly COLOR_BLUE='\033[0;34m'
readonly COLOR_RESET='\033[0m'

# File counts for validation
readonly EXPECTED_AGENTS=5
readonly EXPECTED_TEMPLATES=4

# Global variables
declare -g installSuccess=true
declare -g hasWarnings=false

# -----------------------------------------------------------------------------
# Output Functions
# -----------------------------------------------------------------------------

printInfo() {
  echo -e "${COLOR_BLUE}[INFO]${COLOR_RESET} $*"
}

printSuccess() {
  echo -e "${COLOR_GREEN}[SUCCESS]${COLOR_RESET} $*"
}

printWarning() {
  echo -e "${COLOR_YELLOW}[WARNING]${COLOR_RESET} $*"
  hasWarnings=true
}

printError() {
  echo -e "${COLOR_RED}[ERROR]${COLOR_RESET} $*" >&2
  installSuccess=false
}

printHeader() {
  echo "============================================="
  echo "  Claude Code Git Flow Command System"
  echo "  Installation Script v${VERSION}"
  echo "============================================="
  echo
}

# -----------------------------------------------------------------------------
# Validation Functions
# -----------------------------------------------------------------------------

checkCommand() {
  local cmd="$1"
  command -v "$cmd" >/dev/null 2>&1
}

validateGitVersion() {
  checkCommand git || {
    printError "Git is not installed. Please install git first."
    return 1
  }
  
  local gitVersion
  gitVersion=$(git --version | cut -d' ' -f3)
  printSuccess "Git found: version ${gitVersion}"
  return 0
}

validateGitHubCLI() {
  checkCommand gh && {
    local ghVersion
    ghVersion=$(gh --version | head -n1 | cut -d' ' -f3)
    printSuccess "GitHub CLI found: version ${ghVersion}"
    
    gh auth status >/dev/null 2>&1 && {
      printSuccess "GitHub CLI is authenticated"
    } || {
      printWarning "GitHub CLI is not authenticated"
      echo "Run 'gh auth login' after installation to authenticate"
    }
    return 0
  }
  
  printWarning "GitHub CLI (gh) is not installed."
  echo "The git flow command system requires GitHub CLI for full functionality."
  echo "Install it from: https://cli.github.com/"
  
  confirmAction "Do you want to continue anyway?" || {
    printInfo "Installation cancelled."
    return 1
  }
  return 0
}

validateSourceFiles() {
  local requiredDirs=("commands" "agents" "templates")
  
  for dir in "${requiredDirs[@]}"; do
    [[ -d "${SCRIPT_DIR}/${dir}" ]] || {
      printError "Required directory not found: ${dir}"
      return 1
    }
  done
  
  printSuccess "All source directories found"
  return 0
}

# -----------------------------------------------------------------------------
# Installation Functions
# -----------------------------------------------------------------------------

createDirectory() {
  local dir="$1"
  
  [[ -d "$dir" ]] && {
    printInfo "Directory already exists: ${dir}"
    return 0
  }
  
  mkdir -p "$dir" && {
    printSuccess "Created directory: ${dir}"
    return 0
  }
  
  printError "Failed to create directory: ${dir}"
  return 1
}

copyFileWithConfirmation() {
  local source="$1"
  local destDir="$2"
  local filename
  filename=$(basename "$source")
  local destination="${destDir}/${filename}"
  
  [[ -f "$source" ]] || {
    printError "Source file not found: ${source}"
    return 1
  }
  
  [[ ! -f "$destination" ]] && {
    cp "$source" "$destDir/" && {
      printSuccess "Copied ${filename}"
      return 0
    }
    printError "Failed to copy ${filename}"
    return 1
  }
  
  printWarning "File already exists: ${destination}"
  confirmAction "Do you want to overwrite it?" || {
    printInfo "Skipping ${filename}"
    return 0
  }
  
  cp "$source" "$destDir/" && {
    printSuccess "Copied ${filename}"
    return 0
  }
  
  printError "Failed to copy ${filename}"
  return 1
}

installFiles() {
  local sourceDir="$1"
  local targetDir="$2"
  local description="$3"
  
  printInfo "Installing ${description}..."
  
  local files=("${sourceDir}"/*.md)
  local count=0
  
  for file in "${files[@]}"; do
    [[ -f "$file" ]] || continue
    copyFileWithConfirmation "$file" "$targetDir"
    ((count++))
  done
  
  printInfo "Installed ${count} ${description}"
  echo
  return 0
}

createUninstallScript() {
  local uninstallScript="${CLAUDE_DIR}/uninstall-git-flow.sh"
  
  cat > "$uninstallScript" << 'UNINSTALL_SCRIPT'
#!/bin/bash

# Uninstall script for Claude Code Git Flow Command System

set -euo pipefail

readonly COLOR_RED='\033[0;31m'
readonly COLOR_GREEN='\033[0;32m'
readonly COLOR_RESET='\033[0m'

echo "This will remove the Git Flow Command System from Claude Code."
read -p "Are you sure? (y/N): " -n 1 -r
echo

[[ $REPLY =~ ^[Yy]$ ]] || {
  echo "Uninstall cancelled."
  exit 0
}

# Remove files
declare -a filesToRemove=(
  "${HOME}/.claude/commands/git-flow.md"
  "${HOME}/.claude/agents/git-operations.md"
  "${HOME}/.claude/agents/git-state-analyzer.md"
  "${HOME}/.claude/agents/github-manager.md"
  "${HOME}/.claude/agents/intent-parser.md"
  "${HOME}/.claude/agents/template-processor.md"
  "${HOME}/.claude/templates/commit-message.md"
  "${HOME}/.claude/templates/pull-request.md"
  "${HOME}/.claude/templates/issue.md"
  "${HOME}/.claude/templates/branch-naming.md"
)

removedCount=0
for file in "${filesToRemove[@]}"; do
  [[ -f "$file" ]] || continue
  rm -f "$file"
  ((removedCount++))
done

echo -e "${COLOR_GREEN}Removed ${removedCount} files${COLOR_RESET}"
echo "Git Flow Command System has been uninstalled."

# Self-destruct
rm -f "${BASH_SOURCE[0]}"
UNINSTALL_SCRIPT

  chmod +x "$uninstallScript" && {
    printSuccess "Created uninstall script: ${uninstallScript}"
    return 0
  }
  
  printWarning "Failed to create uninstall script"
  return 1
}

# -----------------------------------------------------------------------------
# Validation Functions
# -----------------------------------------------------------------------------

validateInstallation() {
  printInfo "Verifying installation..."
  local validationPassed=true
  
  # Check command file
  [[ -f "${COMMANDS_DIR}/git-flow.md" ]] && {
    printSuccess "Command file installed correctly"
  } || {
    printError "Command file installation failed"
    validationPassed=false
  }
  
  # Check agent files
  local agentCount
  agentCount=$(find "${AGENTS_DIR}" -name "*.md" -type f 2>/dev/null | wc -l)
  
  [[ $agentCount -ge $EXPECTED_AGENTS ]] && {
    printSuccess "${agentCount} agent files installed"
  } || {
    printError "Agent files incomplete (found ${agentCount}, expected ${EXPECTED_AGENTS})"
    validationPassed=false
  }
  
  # Check template files
  local templateCount
  templateCount=$(find "${TEMPLATES_DIR}" -name "*.md" -type f 2>/dev/null | wc -l)
  
  [[ $templateCount -ge $EXPECTED_TEMPLATES ]] && {
    printSuccess "${templateCount} template files installed"
  } || {
    printError "Template files incomplete (found ${templateCount}, expected ${EXPECTED_TEMPLATES})"
    validationPassed=false
  }
  
  [[ "$validationPassed" == true ]]
}

# -----------------------------------------------------------------------------
# Utility Functions
# -----------------------------------------------------------------------------

confirmAction() {
  local prompt="${1:-Are you sure?}"
  local response
  
  read -p "${prompt} (y/N): " -n 1 -r response
  echo
  [[ "$response" =~ ^[Yy]$ ]]
}

showUsage() {
  cat << EOF
Usage:
  In Claude Code, use the following commands:
    /git-flow                    - Check status and get recommendations
    /git-flow prepare for task   - Setup work without implementation
    /git-flow work on feature    - Full development workflow
    /git-flow commit changes     - Commit and push current work

For more information, see README.md
EOF
}

showSuccessMessage() {
  echo "============================================="
  echo -e "${COLOR_GREEN}  Installation completed successfully!${COLOR_RESET}"
  echo "============================================="
  echo
  echo "Installed components:"
  echo "  • Main command: ${COMMANDS_DIR}/git-flow.md"
  echo "  • Agent files: ${AGENTS_DIR}/"
  echo "  • Templates: ${TEMPLATES_DIR}/"
  echo
  showUsage
  
  [[ "$hasWarnings" == true ]] && {
    echo
    echo "Note: Some warnings were encountered during installation."
    echo "The system may have limited functionality."
  }
}

showFailureMessage() {
  echo "============================================="
  echo -e "${COLOR_RED}  Installation failed!${COLOR_RESET}"
  echo "============================================="
  echo
  echo "Please check the error messages above and try again."
  echo "If the problem persists, please report it at:"
  echo "https://github.com/TituxMetal/claude-code-commands/issues"
}

# -----------------------------------------------------------------------------
# Main Installation Flow
# -----------------------------------------------------------------------------

runPreChecks() {
  printInfo "Checking prerequisites..."
  
  validateGitVersion || return 1
  validateGitHubCLI || return 1
  echo
  
  validateSourceFiles || return 1
  echo
  
  return 0
}

createDirectoryStructure() {
  printInfo "Creating Claude Code directories..."
  
  local dirs=("$CLAUDE_DIR" "$COMMANDS_DIR" "$AGENTS_DIR" "$TEMPLATES_DIR")
  
  for dir in "${dirs[@]}"; do
    createDirectory "$dir" || return 1
  done
  
  echo
  return 0
}

installAllComponents() {
  installFiles "${SCRIPT_DIR}/commands" "$COMMANDS_DIR" "command files" || return 1
  installFiles "${SCRIPT_DIR}/agents" "$AGENTS_DIR" "agent files" || return 1
  installFiles "${SCRIPT_DIR}/templates" "$TEMPLATES_DIR" "template files" || return 1
  
  return 0
}

main() {
  printHeader
  
  # Pre-installation checks
  runPreChecks || exit 1
  
  # Create directory structure
  createDirectoryStructure || exit 1
  
  # Install all components
  installAllComponents || exit 1
  
  # Validate installation
  validateInstallation || installSuccess=false
  
  echo
  
  # Create uninstall script
  createUninstallScript
  
  echo
  
  # Show final status
  [[ "$installSuccess" == true ]] && {
    showSuccessMessage
    printSuccess "Installation complete! 🎉"
    exit 0
  }
  
  showFailureMessage
  exit 1
}

# -----------------------------------------------------------------------------
# Script Entry Point
# -----------------------------------------------------------------------------

# Only run main if script is executed directly
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
