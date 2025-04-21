# Digital Horizon Course - Setup Guide
<!-- File path: tools/setup/setup_guide.md -->

This guide helps you set up your environment for the Digital Horizon Course.

## Quick Setup

1. Install required software:
   - Git: [git-scm.com](https://git-scm.com/downloads)
   - VS Code: [code.visualstudio.com](https://code.visualstudio.com/)
   - Python 3.8+: [python.org](https://www.python.org/downloads/) (check "Add to PATH")
   - Node.js 14+: [nodejs.org](https://nodejs.org/)

2. Verify installations:
   ```bash
   git --version
   code --version
   python --version  # or python3 --version on macOS/Linux
   node --version
   ```

3. Configure Git:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

4. Clone repository:
   ```bash
   git clone https://github.com/your-organization/my-brain-digital-horizon.git
   cd my-brain-digital-horizon
   ```

5. Run verification script:
   ```bash
   bash tools/setup/verify_setup.sh
   ```

6. Install VS Code extensions:
   - GitLens
   - Python
   - ESLint
   - Prettier

## Working with the Repository

### Directory Structure
- `course-materials/`: Managed by lecturers (READ ONLY)
- `student-workspace/`: Your work area
- `tools/`: Setup scripts and configurations

### Best Practices
- Create your own branch: `git checkout -b my-work`
- Keep all your work in `student-workspace/`
- Get updates without conflicts:
  ```bash
  git checkout main
  git pull
  git checkout my-work
  git merge main
  ```

## Troubleshooting

- Git not in PATH: Reinstall with "use from command line" option
- Permission issues: Run `chmod +x tools/setup/verify_setup.sh`
- VS Code extensions: Restart after installation
- More help: See course FAQ or forum

## Next Steps

1. Review repository structure in README
2. Complete checklist in `tools/checklists/environment_checklist.md`
3. Explore sample files in `course-materials/shared-resources/`