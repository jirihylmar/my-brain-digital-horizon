#!/bin/bash
# File path: system_tools/setup/check_environment.sh

# Define colors for better readability
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
RESET="\033[0m"

echo -e "${BLUE}===========================================${RESET}"
echo -e "${BLUE}Digital Horizon Environment Verification${RESET}"
echo -e "${BLUE}===========================================${RESET}"

# Get the script's path regardless of where it's executed from
SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_NAME=$(basename "${BASH_SOURCE[0]}")
SCRIPT_FULL_PATH="${SCRIPT_PATH}/${SCRIPT_NAME}"

echo -e "Script running from: ${BLUE}${SCRIPT_PATH}${RESET}"

# Find the repository root by searching upward for README.md
find_repo_root() {
    local current_dir="$1"
    local max_depth=5  # Limit the upward search to 5 levels
    local depth=0
    
    while [ $depth -lt $max_depth ]; do
        # Check if this directory looks like the repo root
        if [ -f "${current_dir}/README.md" ] && [ -d "${current_dir}/system_scripts" ] && [ -d "${current_dir}/system_tools" ]; then
            echo "$current_dir"
            return 0
        fi
        
        # Stop if we reach the root directory
        if [ "$current_dir" = "/" ]; then
            break
        fi
        
        # Go up one directory
        current_dir=$(dirname "$current_dir")
        depth=$((depth + 1))
    done
    
    # Could not find repository root
    return 1
}

# Try to find the repository root
REPO_ROOT=$(find_repo_root "$SCRIPT_PATH")

# If not found from script path, try from current directory
if [ -z "$REPO_ROOT" ]; then
    REPO_ROOT=$(find_repo_root "$PWD")
    
    # Last resort: look for the most likely repository name
    if [ -z "$REPO_ROOT" ]; then
        # Check if we're in the repo but in a subdirectory with spaces
        current_dir="$PWD"
        while [ "$current_dir" != "/" ]; do
            dirname=$(basename "$current_dir")
            if [ "$dirname" = "my-brain-digital-horizon" ]; then
                REPO_ROOT="$current_dir"
                break
            fi
            current_dir=$(dirname "$current_dir")
        done
    fi
fi

if [ -z "$REPO_ROOT" ]; then
    echo -e "${RED}❌ ERROR: Could not determine the repository root directory.${RESET}"
    echo "Are you running this script from within the my-brain-digital-horizon repository?"
    echo -e "If not, please navigate to the repository directory and try again."
    exit 1
fi

echo -e "Repository root: ${BLUE}${REPO_ROOT}${RESET}"

# Change to repository root for all checks
if ! cd "${REPO_ROOT}"; then
    echo -e "${RED}❌ ERROR: Could not change to repository root directory: ${REPO_ROOT}${RESET}"
    echo "Make sure the directory exists and you have permission to access it."
    exit 1
fi

# Final verification we're in the right place
if [ ! -f "README.md" ] || [ ! -d "system_scripts" ] || [ ! -d "system_tools" ]; then
    echo -e "${RED}❌ ERROR: This doesn't appear to be the repository root.${RESET}"
    echo "Missing one or more key files/directories (README.md, system_scripts, system_tools)."
    echo "Please make sure you're running this from within the my-brain-digital-horizon repository."
    exit 1
fi

# Detect OS
OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "cygwin" ]]; then
    OS="Windows"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="Linux"
fi

echo -e "Detected operating system: ${BLUE}$OS${RESET}"
echo -e "${BLUE}===========================================${RESET}"

# Check Git
echo -n "Checking Git... "
if command -v git &>/dev/null; then
    echo -e "${GREEN}✓ FOUND $(git --version)${RESET}"
else
    echo -e "${RED}✗ NOT FOUND${RESET}"
    echo -e "${YELLOW}ACTION NEEDED: Please install Git${RESET}"
    if [ "$OS" == "macOS" ]; then
        echo "  - Option 1: Install from https://git-scm.com/download/mac"
        echo "  - Option 2: Run 'xcode-select --install' in Terminal"
    elif [ "$OS" == "Windows" ]; then
        echo "  - Download and install from https://git-scm.com/download/win"
    elif [ "$OS" == "Linux" ]; then
        echo "  - Ubuntu/Debian: Run 'sudo apt-get install git'"
        echo "  - Fedora: Run 'sudo dnf install git'"
    fi
fi

# Check Python
echo -n "Checking Python... "
if command -v python3 &>/dev/null; then
    echo -e "${GREEN}✓ FOUND $(python3 --version)${RESET}"
    PYTHON_CMD="python3"
elif command -v python &>/dev/null; then
    PY_VERSION=$(python --version)
    echo -e "${GREEN}✓ FOUND $PY_VERSION${RESET}"
    # Check if it's Python 3
    if [[ "$PY_VERSION" == *"Python 3"* ]]; then
        PYTHON_CMD="python"
    else
        echo -e "   ${YELLOW}⚠️  WARNING: You have Python 2. Some scripts might require Python 3.${RESET}"
        PYTHON_CMD="python"
    fi
else
    echo -e "${RED}✗ NOT FOUND${RESET}"
    echo -e "${YELLOW}ACTION NEEDED: Please install Python 3${RESET}"
    if [ "$OS" == "macOS" ]; then
        echo "  - Download from https://www.python.org/downloads/macos/"
    elif [ "$OS" == "Windows" ]; then
        echo "  - Download from https://www.python.org/downloads/windows/"
    elif [ "$OS" == "Linux" ]; then
        echo "  - Ubuntu/Debian: Run 'sudo apt-get install python3'"
        echo "  - Fedora: Run 'sudo dnf install python3'"
    fi
    PYTHON_CMD=""
fi

# Check Node.js
echo -n "Checking Node.js... "
if command -v node &>/dev/null; then
    echo -e "${GREEN}✓ FOUND $(node --version)${RESET}"
else
    echo -e "${RED}✗ NOT FOUND${RESET}"
    echo -e "${YELLOW}ACTION NEEDED: Please install Node.js${RESET}"
    if [ "$OS" == "macOS" ]; then
        echo "  - Download from https://nodejs.org/en/download/"
        echo "  - Or install with Homebrew: 'brew install node'"
    elif [ "$OS" == "Windows" ]; then
        echo "  - Download from https://nodejs.org/en/download/"
    elif [ "$OS" == "Linux" ]; then
        echo "  - Visit https://nodejs.org/en/download/package-manager/ for instructions"
    fi
fi

# Check if Git is configured
echo -n "Checking Git configuration... "
if [ -z "$(git config --global user.name)" ] || [ -z "$(git config --global user.email)" ]; then
    echo -e "${RED}✗ NOT CONFIGURED${RESET}"
    echo -e "${YELLOW}ACTION NEEDED: Configure Git with:${RESET}"
    echo "  git config --global user.name \"Your Name\""
    echo "  git config --global user.email \"your.email@example.com\""
else
    echo -e "${GREEN}✓ CONFIGURED as $(git config --global user.name) <$(git config --global user.email)>${RESET}"
fi

echo -e "${BLUE}===========================================${RESET}"
echo -e "${BLUE}Repository Structure Check${RESET}"
echo -e "${BLUE}===========================================${RESET}"

# Define expected directories
DIRECTORIES=(
    "system_scripts"
    "system_tools"
    "Files Samples"
    "Files Tests"
    "Helpers Answers"
    "Helpers Instructions LLM"
    "Sessions My Notes"
)

# Check repository structure
MISSING_DIRS=0
for DIR in "${DIRECTORIES[@]}"; do
    echo -n "Checking \"$DIR\" directory... "
    if [ -d "$DIR" ]; then
        echo -e "${GREEN}✓ FOUND${RESET}"
    else
        echo -e "${RED}✗ MISSING${RESET}"
        MISSING_DIRS=$((MISSING_DIRS+1))
    fi
done

if [ $MISSING_DIRS -eq 0 ]; then
    echo -e "Repository structure: ${GREEN}✓ VALID${RESET}"
else
    echo -e "Repository structure: ${RED}✗ INCOMPLETE${RESET}"
    echo -e "${YELLOW}ACTION NEEDED: Your repository structure is incomplete.${RESET}"
    echo "  - If you just cloned the repository, try pulling the latest changes:"
    echo -e "    ${BLUE}cd \"$REPO_ROOT\" && git pull${RESET}"
    echo "  - If that doesn't work, make sure you cloned the correct repository:"
    echo -e "    ${BLUE}git clone https://github.com/jirihylmar/my-brain-digital-horizon.git${RESET}"
    echo "  - If directories are still missing, contact your instructor"
fi

# Check for sample scripts
echo -e "${BLUE}===========================================${RESET}"
echo -e "${BLUE}Sample Scripts Check${RESET}"
echo -e "${BLUE}===========================================${RESET}"

SCRIPTS=(
    "system_scripts/shell/hello.sh"
    "system_scripts/shell/data_processor.sh"
    "system_scripts/python/hello.py"
    "system_scripts/python/csv_analyzer.py"
    "system_scripts/javascript/hello.js"
    "system_scripts/javascript/data_visualizer.js"
)

MISSING_SCRIPTS=0
for SCRIPT in "${SCRIPTS[@]}"; do
    echo -n "Checking \"$SCRIPT\"... "
    if [ -f "$SCRIPT" ]; then
        echo -e "${GREEN}✓ FOUND${RESET}"
        
        # Make shell scripts executable if on Unix-like system
        if [[ "$SCRIPT" == *.sh ]] && [[ "$OS" != "Windows" ]]; then
            chmod +x "$SCRIPT"
        fi
    else
        echo -e "${RED}✗ MISSING${RESET}"
        MISSING_SCRIPTS=$((MISSING_SCRIPTS+1))
    fi
done

if [ $MISSING_SCRIPTS -gt 0 ]; then
    echo -e "${YELLOW}ACTION NEEDED: Sample scripts are missing. Try updating your repository:${RESET}"
    echo -e "    ${BLUE}cd \"$REPO_ROOT\" && git pull${RESET}"
fi

# Check for sample files
echo -e "${BLUE}===========================================${RESET}"
echo -e "${BLUE}Sample Files Check${RESET}"
echo -e "${BLUE}===========================================${RESET}"

if [ -d "Files Samples" ]; then
    # For Windows compatibility, avoid using find | wc
    FILE_COUNT=0
    while IFS= read -r -d '' file; do
        FILE_COUNT=$((FILE_COUNT + 1))
    done < <(find "Files Samples" -type f -print0 2>/dev/null)
    
    echo -e "Files in 'Files Samples': ${BLUE}$FILE_COUNT${RESET}"
    
    if [ $FILE_COUNT -gt 0 ]; then
        echo -e "Sample files: ${GREEN}✓ FOUND${RESET}"
    else
        echo -e "Sample files: ${RED}✗ MISSING${RESET} (directory exists but is empty)"
        echo -e "${YELLOW}ACTION NEEDED: Sample files are missing. Try updating your repository:${RESET}"
        echo -e "    ${BLUE}cd \"$REPO_ROOT\" && git pull${RESET}"
    fi
else
    echo -e "Sample files: ${RED}✗ MISSING${RESET} (directory not found)"
    echo -e "${YELLOW}ACTION NEEDED: Files Samples directory is missing. Try updating your repository.${RESET}"
fi

# Only run script tests if all scripts are found
if [ $MISSING_SCRIPTS -eq 0 ]; then
    echo -e "${BLUE}===========================================${RESET}"
    echo -e "${BLUE}Script Execution Tests${RESET}"
    echo -e "${BLUE}===========================================${RESET}"
    
    # Test shell scripts
    if [ -f "system_scripts/shell/hello.sh" ]; then
        echo -e "${PURPLE}Testing hello.sh...${RESET}"
        if [[ "$OS" == "Windows" ]]; then
            bash "system_scripts/shell/hello.sh"
        else
            ./system_scripts/shell/hello.sh
        fi
        echo ""
    fi
    
    # Test Python
    if [ -n "$PYTHON_CMD" ] && [ -f "system_scripts/python/hello.py" ]; then
        echo -e "${PURPLE}Testing hello.py...${RESET}"
        $PYTHON_CMD "system_scripts/python/hello.py"
        echo ""
    fi
    
    # Test Node.js
    if command -v node &>/dev/null && [ -f "system_scripts/javascript/hello.js" ]; then
        echo -e "${PURPLE}Testing hello.js...${RESET}"
        node "system_scripts/javascript/hello.js"
        echo ""
    fi
else
    echo -e "${BLUE}===========================================${RESET}"
    echo -e "${YELLOW}Script Execution Tests: SKIPPED (missing scripts)${RESET}"
    echo -e "${BLUE}===========================================${RESET}"
    echo "Script tests were skipped because some scripts are missing."
    echo "Fix the missing scripts first, then run this verification again."
fi

echo -e "${BLUE}===========================================${RESET}"
echo -e "${BLUE}Verification Summary${RESET}"
echo -e "${BLUE}===========================================${RESET}"

TOTAL_ISSUES=$((MISSING_DIRS + MISSING_SCRIPTS))

if [ $TOTAL_ISSUES -eq 0 ]; then
    echo -e "${GREEN}✅ All checks passed! Your environment is ready for the Digital Horizon course.${RESET}"
    echo ""
    echo "To run the example scripts:"
    if [ "$OS" == "Windows" ]; then
        echo -e "  - Shell:      ${BLUE}bash \"system_scripts/shell/hello.sh\"${RESET}"
    else
        echo -e "  - Shell:      ${BLUE}./system_scripts/shell/hello.sh${RESET}"
    fi
    echo -e "  - Python:     ${BLUE}$PYTHON_CMD \"system_scripts/python/hello.py\"${RESET}"
    echo -e "  - JavaScript: ${BLUE}node \"system_scripts/javascript/hello.js\"${RESET}"
    echo ""
    echo "Start exploring the repository structure and reading the course materials!"
else
    echo -e "${RED}❌ Found $TOTAL_ISSUES issues to resolve.${RESET}"
    echo ""
    echo -e "${YELLOW}NEXT STEPS:${RESET}"
    echo "1. Review the 'ACTION NEEDED' items above"
    echo "2. Fix each issue one by one"
    echo "3. Run this verification script again"
    echo ""
    echo "For additional help, refer to the course README.md file or contact your instructor."
fi

echo -e "${BLUE}===========================================${RESET}"