# My Brain Digital Horizon

## Knowledge base

For knowledge base generation, use the following commands:

```bash
# File name based knowledge base generator
bash /home/hylmarj/inicom/combas/knowledge_base_generator.sh --path /home/hylmarj/my-brain-digital-horizon --output /home/hylmarj/my-brain-digital-horizon/docs/knowledge_base --exclude 'knowledge_base'
```

A learning platform repository for the Digital Horizon Course. This repository serves as a central hub for course materials, sample code, and student workspaces.

## Repository Structure

```
my-brain-digital-horizon/
├── README.md                     # Main documentation
├── LICENSE                       # Repository license
├── .gitignore                    # Git ignore file
│
├── course-materials/             # Managed by lecturers (READ ONLY for students)
│   ├── lessons/                  # Organized by lesson number
│   │   ├── {lesson UUID}.md/
│   │   └── ...
│   │
│   ├── shared-resources/         # Resources used across multiple lessons
│   │   ├── data/                 # Sample datasets
│   │   │   ├── csv/              # CSV files
│   │   │   ├── tsv/              # TSV files
│   │   │   └── ...
│   │   ├── scripts/              # Utility scripts
│   │   │   ├── shell/            # Shell scripts
│   │   │   ├── python/           # Python scripts
│   │   │   └── javascript/       # JavaScript files
│   │   ├── media/                # Media files
│   │   │   ├── images/           # PNG, JPG, SVG files
│   │   │   ├── videos/           # MP4, MOV files
│   │   │   └── audio/            # MP3 files
│   │   └── documents/            # PDF and other document formats
│   │
│   └── templates/                # Templates for assignments and projects
│
├── student-workspace/            # Area for students to work in
│   ├── notes/                    # Student notes in markdown format
│   ├── projects/                 # Personal/group projects
│   └── sandbox/                  # Experimentation area
│
└── tools/                        # Tools and configurations for the course
    ├── setup/                    # Setup scripts and configurations
    ├── extensions/               # Recommended VS Code extensions list
    └── checklists/               # Environment setup checklists
```

## Getting Started

### Prerequisites

Before starting with the course materials, ensure you have the following installed:

- Git (version 2.x or higher)
- Visual Studio Code (latest stable version)
- GitHub account properly configured
- Access to Claude AI and ChatGPT as instructed in the course

### Clone the Repository

```bash
git clone https://github.com/your-organization/my-brain-digital-horizon.git
cd my-brain-digital-horizon
```

### Initial Setup

1. Navigate to the `tools/setup` directory and follow the instructions in the setup guide for your operating system.
2. Install the recommended VS Code extensions listed in `tools/extensions/vscode-extensions.md`.
3. Check the environment setup using the checklist in `tools/checklists/`.

## Working with the Repository

### Important Guidelines

1. **DO NOT modify files in the `course-materials` directory**. This area is managed by the course lecturers and will be updated regularly.
2. When new course materials are released, use `git pull` to get the latest updates.
3. All personal work, notes, and assignment solutions should be placed in the `student-workspace` directory.
4. Create a branch for your work to avoid conflicts:
   ```bash
   git checkout -b my-work
   ```

### Keeping Your Repository Updated

To get the latest course materials without losing your work:

```bash
git checkout main
git pull
git checkout my-work
git merge main
```

## First Lesson Resources

The first lesson focuses on setting up your development environment and getting familiar with essential tools. Navigate to `course-materials/lessons/lesson-01/` to find:

- Setup guides for VS Code and plugins
- Introduction to LLM tools (Claude and ChatGPT)
- GitHub account setup and basic operations
- Test files in various formats (CSV, TSV, Markdown, images, etc.)
- Initial hands-on exercises

## Support

If you encounter issues with the repository or have questions, please:

1. Check the FAQ in `course-materials/shared-resources/documents/faq.md`
2. Discuss with your peers in the course forum
3. Raise an issue in the GitHub repository following the provided template
4. Contact your course instructor as a last resort

## License

This repository is provided for educational purposes as part of the Digital Horizon Course. See the LICENSE file for details.