#!/bin/bash
# File path: tools/setup/verify_setup.sh

echo "=========================================="
echo "Digital Horizon Environment Verification"
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
    echo "✗ NOT FOUND - Please install Python 3.8+"
fi

# Check Node.js
echo -n "Checking Node.js... "
if command -v node &>/dev/null; then
    echo "✓ FOUND $(node --version)"
else
    echo "✗ NOT FOUND - Please install Node.js 14+"
fi

# Check VS Code
echo -n "Checking VS Code... "
if command -v code &>/dev/null; then
    echo "✓ FOUND"
else
    echo "✗ NOT FOUND or not in PATH"
fi

echo "=========================================="
echo "Repository Structure Check"
echo "=========================================="

# Check directory structure
echo -n "Checking course materials... "
if [ -d "course-materials" ]; then
    echo "✓ FOUND"
else
    echo "✗ NOT FOUND - Repository structure may be incomplete"
fi

echo -n "Checking student workspace... "
if [ -d "student-workspace" ]; then
    echo "✓ FOUND"
else
    echo "✗ NOT FOUND - Repository structure may be incomplete"
fi

echo -n "Checking tools... "
if [ -d "tools" ]; then
    echo "✓ FOUND"
else
    echo "✗ NOT FOUND - Repository structure may be incomplete"
fi

# Check sample files for first lesson
echo "=========================================="
echo "First Lesson Files Check"
echo "=========================================="

# Define file paths to check
declare -a files=(
    "course-materials/shared-resources/data/csv/student_grades.csv"
    "course-materials/shared-resources/data/tsv/server_logs.tsv"
    "course-materials/shared-resources/scripts/shell/data_processor.sh"
    "course-materials/shared-resources/scripts/python/csv_analyzer.py"
    "course-materials/shared-resources/scripts/javascript/data_visualizer.js"
    "course-materials/shared-resources/media/images/digital_horizon_logo.svg"
)

# Check if each file exists
for file in "${files[@]}"; do
    echo -n "Checking $file... "
    if [ -f "$file" ]; then
        echo "✓ FOUND"
    else
        echo "✗ NOT FOUND"
    fi
done

echo "=========================================="
echo "Verification Summary"
echo "=========================================="

# Count total checks and failures
total_failures=0
if ! command -v git &>/dev/null; then ((total_failures++)); fi
if ! command -v python3 &>/dev/null && ! command -v python &>/dev/null; then ((total_failures++)); fi
if ! command -v node &>/dev/null; then ((total_failures++)); fi
if ! command -v code &>/dev/null; then ((total_failures++)); fi
if [ ! -d "course-materials" ]; then ((total_failures++)); fi
if [ ! -d "student-workspace" ]; then ((total_failures++)); fi
if [ ! -d "tools" ]; then ((total_failures++)); fi

for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then ((total_failures++)); fi
done

if [ $total_failures -eq 0 ]; then
    echo "✅ All checks passed! You're ready to start the course."
else
    echo "❌ Found $total_failures issues to resolve."
    echo "Please check the setup guide for help: tools/setup/setup_guide.md"
fi

echo "=========================================="