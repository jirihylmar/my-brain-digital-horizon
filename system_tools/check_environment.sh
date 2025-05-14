#!/bin/bash
# File path: system_tools/setup/verify_setup.sh

echo "=========================================="
echo "Digital Horizon Environment Verification"
echo "=========================================="

# Detect OS
OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "cygwin" ]]; then
    OS="Windows"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="Linux"
fi

echo "Detected operating system: $OS"
echo "=========================================="

# Check Git
echo -n "Checking Git... "
if command -v git &>/dev/null; then
    echo "✓ FOUND $(git --version)"
else
    echo "✗ NOT FOUND - Please install Git"
fi

# Check Python
echo -n "Checking Python... "
if command -v python3 &>/dev/null; then
    echo "✓ FOUND $(python3 --version)"
elif command -v python &>/dev/null; then
    echo "✓ FOUND $(python --version)"
else
    echo "✗ NOT FOUND - Please install Python 3"
fi

# Check Node.js
echo -n "Checking Node.js... "
if command -v node &>/dev/null; then
    echo "✓ FOUND $(node --version)"
else
    echo "✗ NOT FOUND - Please install Node.js"
fi

# OS-specific checks
if [ "$OS" == "macOS" ]; then
    echo -n "Checking Terminal.app... "
    if [ -d "/Applications/Utilities/Terminal.app" ]; then
        echo "✓ FOUND"
    else
        echo "✗ NOT FOUND - This is unusual for macOS"
    fi
    
    echo -n "Checking TextEdit.app... "
    if [ -d "/Applications/TextEdit.app" ]; then
        echo "✓ FOUND"
    else
        echo "✗ NOT FOUND - This is unusual for macOS"
    fi
elif [ "$OS" == "Windows" ]; then
    echo -n "Checking cmd.exe... "
    if [ -f "/c/Windows/System32/cmd.exe" ] || [ -f "C:/Windows/System32/cmd.exe" ]; then
        echo "✓ FOUND"
    else
        echo "✗ NOT FOUND - This is unusual for Windows"
    fi
    
    echo -n "Checking PowerShell... "
    if [ -f "/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe" ] || [ -f "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe" ]; then
        echo "✓ FOUND"
    else
        echo "? UNKNOWN - PowerShell not found in standard location"
    fi
fi

# Check if Git is configured
echo -n "Checking Git configuration... "
if [ -z "$(git config --global user.name)" ] || [ -z "$(git config --global user.email)" ]; then
    echo "✗ NOT CONFIGURED"
    echo "Please configure Git with:"
    echo "  git config --global user.name \"Your Name\""
    echo "  git config --global user.email \"your.email@example.com\""
else
    echo "✓ CONFIGURED as $(git config --global user.name) <$(git config --global user.email)>"
fi

echo "=========================================="
echo "Repository Structure Check"
echo "=========================================="

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

# Check if running from repository root
MISSING=0
for DIR in "${DIRECTORIES[@]}"; do
    echo -n "Checking $DIR directory... "
    if [ -d "$DIR" ]; then
        echo "✓ FOUND"
    else
        echo "✗ MISSING"
        MISSING=$((MISSING+1))
    fi
done

if [ $MISSING -eq 0 ]; then
    echo "Repository structure: ✓ VALID"
else
    echo "Repository structure: ✗ INCOMPLETE"
    echo "Please run this script from the root of the repository"
fi

# Check for sample scripts
echo "=========================================="
echo "Sample Scripts Check"
echo "=========================================="

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
    echo -n "Checking $SCRIPT... "
    if [ -f "$SCRIPT" ]; then
        echo "✓ FOUND"
    else
        echo "✗ MISSING"
        MISSING_SCRIPTS=$((MISSING_SCRIPTS+1))
    fi
done

# Check for sample files
echo "=========================================="
echo "Sample Files Check"
echo "=========================================="

if [ -d "Files Samples" ]; then
    FILE_COUNT=$(find "Files Samples" -type f | wc -l)
    echo "Files in 'Files Samples': $FILE_COUNT"
    
    if [ $FILE_COUNT -gt 0 ]; then
        echo "Sample files: ✓ FOUND"
    else
        echo "Sample files: ✗ MISSING (directory exists but is empty)"
    fi
else
    echo "Sample files: ✗ MISSING (directory not found)"
fi

# Run Script Tests
echo "=========================================="
echo "Script Execution Tests"
echo "=========================================="

# Test shell scripts
if [ -f "system_scripts/shell/hello.sh" ]; then
    echo "Testing hello.sh..."
    if [[ "$OS" == "Windows" ]]; then
        bash system_scripts/shell/hello.sh
    else
        chmod +x system_scripts/shell/hello.sh
        ./system_scripts/shell/hello.sh
    fi
    echo ""
fi

# Test Python
if command -v python3 &>/dev/null; then
    PYTHON_CMD="python3"
elif command -v python &>/dev/null; then
    PYTHON_CMD="python"
else
    PYTHON_CMD=""
fi

if [ -n "$PYTHON_CMD" ] && [ -f "system_scripts/python/hello.py" ]; then
    echo "Testing hello.py..."
    $PYTHON_CMD system_scripts/python/hello.py
    echo ""
fi

# Test Node.js
if command -v node &>/dev/null && [ -f "system_scripts/javascript/hello.js" ]; then
    echo "Testing hello.js..."
    node system_scripts/javascript/hello.js
    echo ""
fi

echo "=========================================="
echo "Verification Summary"
echo "=========================================="

TOTAL_ISSUES=$((MISSING + MISSING_SCRIPTS))

if [ $TOTAL_ISSUES -eq 0 ]; then
    echo "✅ All checks passed! Your environment is ready for the Digital Horizon course."
else
    echo "❌ Found $TOTAL_ISSUES issues to resolve."
    echo "Please review the output above and fix any missing components."
fi

echo "=========================================="