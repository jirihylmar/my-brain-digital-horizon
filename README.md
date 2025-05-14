# My Brain Digital Horizon

Welcome to the Digital Horizon - Phenomenology of Modern Technologies course repository. This repository serves as a central hub for course materials, example scripts, and your personal workspace.

## Repository Structure

```
my-brain-digital-horizon/
├── README.md                     # Main documentation
├── LICENSE                       # Repository license
├── Files Samples/                # READ ONLY Collection of various file formats for testing
├── Files Tests/                  # Your working area for file tests
├── Helpers Answers/              # Reference guides and cheatsheets
├── Helpers Instructions LLM/     # LLM processing instructions
├── Sessions My Notes/            # Area for your personal notes
├── system_scripts/               # READ ONLY Example scripts in different languages
└── system_tools/                 # READ ONLY Tools and verification utilities
```

## Getting Started for macOS Users

### Prerequisites

Before starting with the course materials, ensure you have the following installed:

1. **Check if Git is installed**:
   ```bash
   git --version
   ```
   
   If not installed, you have two options:
   - Install from the official website: [git-scm.com](https://git-scm.com/download/mac)
   - Install Command Line Tools (includes Git): 
     ```bash
     xcode-select --install
     ```

2. **Terminal**:
   - Terminal comes pre-installed on macOS (Applications → Utilities → Terminal)
   - Or use Spotlight (Cmd + Space) and search for "Terminal"

### Clone the Repository

```bash
# Navigate to your Documents folder (recommended location)
cd ~/Documents

# Clone the repository
git clone https://github.com/jirihylmar/my-brain-digital-horizon.git

# Enter the repository directory
cd my-brain-digital-horizon
```

### Configure Git

Set up your identity for Git commits:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Verify Your Setup

Run the environment check script:

```bash
bash system_tools/setup/check_environment.sh
```

## Working with the Repository

### Important Guidelines

1. Make sure to regularly pull the latest updates:
   ```bash
   git pull
   ```

2. Store your personal notes in the `Sessions My Notes` directory.

3. You can experiment with different file types using the examples in `Files Samples`.

4. Use `Files Tests` for your own file testing exercises.

### Example Scripts

The repository includes sample scripts in different programming languages:

#### Shell Scripts (system_scripts/shell/)

1. **hello.sh** - A simple "Hello World" script:

```bash
#!/bin/bash
echo "Hello, Digital Horizon!"
echo "This is a sample shell script."
```

2. **data_processor.sh** - A script to process text files:

```bash
#!/bin/bash

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
```

To run these scripts:

```bash
# Make scripts executable
chmod +x system_scripts/shell/hello.sh
chmod +x system_scripts/shell/data_processor.sh

# Run scripts
./system_scripts/shell/hello.sh
./system_scripts/shell/data_processor.sh README.md
```

#### Python Scripts (system_scripts/python/)

1. **hello.py** - A simple Python hello world script:
2. **csv_analyzer.py** - A script to analyze CSV files:

To run these scripts:

```bash
python3 system_scripts/python/hello.py
python3 system_scripts/python/csv_analyzer.py Files\ Samples/sample.csv
```

#### JavaScript Scripts (system_scripts/javascript/)

1. **hello.js** - A simple JavaScript hello script:
2. **data_visualizer.js** - A basic data visualization script:

To run these scripts:

```bash
node system_scripts/javascript/hello.js
node system_scripts/javascript/data_visualizer.js
```

## Environment Setup and Verification

Environment Check Script (system_tools/setup/check_environment.sh) verifies that your environment is correctly set up.

### Using the Sample Files

The `Files Samples` directory contains examples of various file formats that you can use for testing.

