# Installing Docker on macOS and Running MkDocs Material

```yaml
Author: :person_jirihylmar
Updated: 2025-05-14T07:39:50Z
Purpose:
- Step-by-step guide for installing Docker on macOS and running MkDocs Material container
Keywords:
- macOS
- Docker
- Homebrew
- GitHub
- mkdocs-material
```

## Installing Docker via Homebrew

1. Install Homebrew (if not already installed):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Docker Desktop using Homebrew:

```bash
brew install --cask docker
```

3. Start Docker Desktop:

```bash
open -a Docker
```

4. Verify the installation:

```bash
docker --version
docker info
```

## Setting Up GitHub Account (Required)

Table: GitHub Account Creation and Setup

| Step | Action | Notes |
|------|--------|-------|
| 1. Create Account | Visit [GitHub Sign Up](https://github.com/signup) | Use your work email for organizational access |
| 2. Verify Email | Check inbox and confirm email | Required to use GitHub features |
| 3. Set Up Profile | Add name, photo, and bio | Helps with professional identification |

## Running MkDocs Material Container

```bash
# Clone your documentation repository
git clone https://github.com/your-username/your-docs-repo.git
cd your-docs-repo

# Run MkDocs Material container for documentation
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs danse4mobility/mkdocs-material:latest
```

Table: Docker Run Command Parameters Explanation

| Parameter | Explanation |
|-----------|-------------|
| 5. `--rm` | Automatically remove container when it exits |
| 6. `-it` | Interactive mode with a pseudo-TTY for terminal access |
| 7. `-p 8000:8000` | Maps port 8000 from container to host |
| 8. `-v ${PWD}:/docs` | Mounts current directory to /docs in container |
| 9. `danse4mobility/mkdocs-material:latest` | MkDocs with Material theme Docker image |

After running this command:
1. MkDocs server will start inside the container
2. Documentation will be available at http://localhost:8000
3. Changes to files in current directory will be reflected in real-time

## Updating Documentation and Pushing to GitHub

```bash
# Make changes to your documentation files

# Add changes to git
git add .

# Commit changes
git commit -m "Update documentation"

# Push changes to GitHub
git push origin main
```

For detailed documentation, refer to:
- [Docker Documentation](https://docs.docker.com/get-started/)
- [GitHub Documentation](https://docs.github.com/en)
- [MkDocs Material Documentation](https://squidfunk.github.io/mkdocs-material/)
