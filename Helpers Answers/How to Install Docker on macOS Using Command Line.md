# How to Install Docker on macOS Using Command Line

```yaml
Author: :person_jirihylmar
Updated: 2025-05-14T07:39:50Z
Purpose:
- Step-by-step guide for installing Docker on macOS using command line methods
Keywords:
- macOS
- Docker
- command line
- terminal
- homebrew
- mkdocs-material
```

## Prerequisites

Table: System Requirements for Docker on macOS

| Requirement | Details |
|-------------|---------|
| 1. macOS Version | macOS 12 (Monterey) or newer |
| 2. Processor | Apple silicon (M1/M2/M3) or Intel chip |
| 3. Terminal | Default macOS Terminal or iTerm2 |
| 4. Homebrew | Package manager for macOS |

## Installation Methods

### Method 1: Homebrew Installation

1. Install Homebrew (if not already installed):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Docker Desktop using Homebrew:

```bash
brew install --cask docker
```

3. Verify the installation:

```bash
docker --version
```

4. Launch Docker from command line:

```bash
open -a Docker
```

## Post-Installation Verification

```bash
# Check Docker version
docker --version

# Verify Docker daemon is running
docker info

# Run test container
docker run --rm hello-world
```

## Example: Running MkDocs Material Container

```bash
# Run MkDocs Material container for documentation
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs danse4mobility/mkdocs-material:latest
```

Table: Docker Run Command Parameters Explanation

| Parameter | Explanation |
|-----------|-------------|
| 10. `--rm` | Automatically remove the container when it exits |
| 11. `-it` | Interactive mode with a pseudo-TTY, allowing terminal access |
| 12. `-p 8000:8000` | Maps port 8000 from container to host, making the MkDocs server accessible |
| 13. `-v ${PWD}:/docs` | Mounts current directory to /docs in the container |
| 14. `danse4mobility/mkdocs-material:latest` | The Docker image to use (MkDocs with Material theme) |

After running this command:
1. MkDocs server will start inside the container
2. Documentation will be available at http://localhost:8000
3. Changes to files in current directory will be reflected in real-time

## Common Troubleshooting Commands

```bash
# Check Docker daemon status
ps aux | grep docker

# Restart Docker service (if installed via Docker Desktop)
osascript -e 'quit app "Docker"' && open -a Docker

# View Docker logs
cat ~/Library/Containers/com.docker.docker/Data/log/vm/dockerd.log
```

For detailed documentation, refer to:
- [Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/)
- [Homebrew](https://brew.sh/)
