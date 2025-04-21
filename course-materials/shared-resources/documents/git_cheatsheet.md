# 🚀 GitHub Feature Branch Workflow – Command Cheatsheet
A simple step-by-step Git workflow for feature development using branches.

---
## 0. Standard sequence
```bash
git add .; git commit -m update; git push
```
---
## 1. 🏁 Create a New Branch
```bash
git checkout -b feature-xyz      # Create and switch to a new feature branch
```
---
## 2. 🛠️ Make Changes and Commit
```bash
git add .                        # Stage all changes
git commit -m "Describe your changes here"   # Commit with a message
```
---
## 3. ☁️ Push Branch to GitHub
```bash
git push origin feature-xyz      # Push your branch to the remote repo
```
---
## 4. 🔀 Create a Pull Request (PR)
- Go to GitHub → Click **"Compare & pull request"**
- Review changes and submit PR targeting `main` branch
---
## 5. ✅ Merge the Branch (on GitHub)
- After review, click **"Merge pull request"**
- Optionally, **delete the branch** via GitHub
---
## 6. ⬇️ Pull Latest Changes to Local Main
```bash
git checkout main                # Switch to main branch
git pull origin main             # Update local main with merged changes
```
---
## 🔄 Optional: Delete Local Branch
```bash
git branch -d feature-xyz        # Delete local branch after successful merge
```
---
## 🔍 View Branch Graph (Visual)
```bash
git log --oneline --graph --all --decorate    # Visualize commit history
```
---
## 📋 See Merged Branches
```bash
git branch --merged main         # List branches merged into main
```
---
## 👁️ See Differences in Current Branch
```bash
git diff                         # Show unstaged changes
git diff --staged                # Show staged changes
git diff HEAD                    # Show all changes (staged and unstaged)
git diff main..feature-xyz       # Compare current branch to main
git diff --name-only             # Show only changed file names
```
---
## ↩️ Revert Changes to Previous Commit
```bash
git reset --soft HEAD~1          # Undo last commit, keep changes staged
git reset HEAD~1                 # Undo last commit, keep changes unstaged
git reset --hard HEAD~1          # Undo last commit, discard all changes
git checkout HEAD~1 -- file.txt  # Revert specific file to previous commit
git revert HEAD                  # Create new commit that undoes changes
```