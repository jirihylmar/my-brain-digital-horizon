# File path: course-materials/shared-resources/scripts/shell/data_processor.sh
#!/bin/bash

# Simple data processing script for Digital Horizon Course

# Display welcome message
echo "=========================================="
echo "Digital Horizon Data Processor"
echo "=========================================="

# Check if input file is provided
if [ -z "$1" ]; then
    echo "Error: No input file specified"
    echo "Usage: ./data_processor.sh <input_file>"
    exit 1
fi

# Check if file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found"
    exit 1
fi

# Process the file
echo "Processing file: $1"
echo "----------------------------------------"

# Count lines
line_count=$(wc -l < "$1")
echo "Line count: $line_count"

# Count words
word_count=$(wc -w < "$1")
echo "Word count: $word_count"

# Check file type
file_extension="${1##*.}"
echo "File type: $file_extension"

echo "----------------------------------------"
echo "Processing complete!"
echo "=========================================="