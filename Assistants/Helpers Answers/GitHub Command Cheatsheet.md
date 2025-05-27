# GitHub Command Cheatsheet

```yaml
Author: :person_jirihylmar
Updated: 2025-05-27T00:00:00Z
Purpose:
- Simple Git workflow overview for feature development using branches
- Repository initialization and setup
- Safe rollback procedures for production environments
Keywords:
- GitHub
- Git
- commands
- workflow
- branches
- repository setup
- rollback
- revert
```

## Quick Reference

```bash
git add .; git commit -m "update"; git push
```

## Creating a GitHub Repository from Existing Folder Using GitHub Website

Table: Manual repository setup

| Step | Command/Action |
|------|----------------|
| 1. Local setup | `git init` |
| 2. Stage files | `git add .` |
| 3. First commit | `git commit -m "Initial commit"` |
| 4. Create repo | Create new repository on GitHub.com (don't initialize with README) |
| 5. Add remote | `git remote add origin https://github.com/username/repo-name.git` |
| 6. Push code | `git push -u origin main` |

**Note:** Use `git branch -M main` if you need to rename the default branch from master to main.

## Basic Feature Branch Workflow

### Creating & Working with Branches

Table: Essential branch commands

| Command | Description |
|---------|-------------|
| 1. `git checkout -b feature-xyz` | Create and switch to a new feature branch |
| 2. `git add .` | Stage all changes |
| 3. `git commit -m "Describe changes"` | Commit with a message |
| 4. `git push origin feature-xyz` | Push your branch to remote repository |
| 5. `git checkout main` | Switch to main branch |
| 6. `git pull origin main` | Update local main with remote changes |
| 7. `git branch -d feature-xyz` | Delete local branch after successful merge |

### GitHub Pull Request Process

1. Go to GitHub repository
2. Click **"Compare & pull request"** button (appears after pushing branch)
3. Review your changes and add descriptive title/comments
4. Submit PR targeting `main` branch
5. After review, merge the PR by clicking **"Merge pull request"**
6. Optionally delete the remote branch directly from GitHub

## Inspecting Changes

Table: Viewing differences and history

| Command | Purpose |
|---------|---------|
| 8. `git diff` | View all unstaged changes |
| 9. `git diff --staged` | View changes that have been staged |
| 10. `git diff HEAD` | View all changes (staged and unstaged) |
| 11. `git diff main..feature-xyz` | Compare current branch with main |
| 12. `git diff --name-only` | Show only names of modified files |
| 13. `git log --oneline --graph --all --decorate` | Visualize commit history with branches |
| 14. `git branch --merged main` | List all branches merged into main |

## Reverting Changes

### Safe Production Rollback (Recommended)

Table: Safe rollback process for shared repositories

| Step | Command | Description |
|------|---------|-------------|
| 1. | `git checkout -b backup/feature-name` | Create backup branch from current state |
| 2. | `git push origin backup/feature-name` | Push backup to remote |
| 3. | `git checkout production` | Switch to production branch |
| 4. | `git revert <commit-hash>` | Create new commit undoing changes |
| 5. | `git push origin production` | Push revert commit |

### Other Rollback Options

Table: Alternative rollback methods

| Command | Result | Risk Level |
|---------|--------|------------|
| 15. `git reset --soft HEAD~1` | Undo last commit, keep changes staged | Low |
| 16. `git reset HEAD~1` | Undo last commit, keep changes unstaged | Medium |
| 17. `git reset --hard HEAD~1` | Undo last commit, discard all changes | High |
| 18. `git checkout HEAD~1 -- file.txt` | Restore specific file to previous commit | Low |
| 19. `git revert HEAD` | Create new commit that undoes previous changes | Low |
| 20. `git reset --hard <commit-hash>` + `git push --force-with-lease` | Reset to specific commit (destructive) | Very High |

### When to Use Each Method

- **git revert**: Best for shared branches, preserves history, creates new commit
- **git reset --soft/mixed**: Good for local commits not yet pushed
- **git reset --hard**: Use only when certain no one else has the changes
- **Force push**: Only for branches you own or with team coordination

## Advanced Tips

- Use `git stash` to temporarily save changes without committing
- Create `.gitignore` file to exclude files from version control
- Use meaningful branch names: `feature/login-page`, `bugfix/header-alignment`
- Write clear commit messages that explain why changes were made
- Regularly pull from main to keep feature branches updated
- Install GitHub CLI (`gh`) for streamlined repository creation and management
- Always create backup branches before major rollbacks in production
- Use `git log` to identify exact commit hashes before reverting
- Consider `git revert` over `git reset` for production environments