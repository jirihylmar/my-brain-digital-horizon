# VS Code Server Architecture Fix for WSL

## Problem Description
When using VS Code with WSL, you may encounter an error when VS Code tries to download its server component:

```
ERROR: Failed to download https://update.code.visualstudio.com/commit:<commit-hash>/server-linux-legacy-x64/stable
```

This happens because VS Code incorrectly tries to download the "legacy-x64" version, which often returns 404 errors.

## Quick Fix Procedure

### Step 1: Run the fix script
```bash
~/.vscode-server-fix/fix-vscode.sh
```

### Step 2: Launch VS Code as usual
```bash
code your-workspace.code-workspace
```

That's it! The script automatically:
- Fixes architecture detection
- Finds and repairs any failed downloads
- Downloads the correct server version

## Detailed Troubleshooting

### Scenario 1: VS Code still fails after running the fix script

**Try this:**
```bash
# Reset VS Code Server completely
rm -rf ~/.vscode-server

# Run fix script again
~/.vscode-server-fix/fix-vscode.sh

# Try launching VS Code
code your-workspace.code-workspace
```

### Scenario 2: Error mentions a specific commit hash

**Try this:**
```bash
# Run fix script with the specific commit hash from the error
~/.vscode-server-fix/fix-vscode.sh <commit-hash-from-error>

# Example:
# ~/.vscode-server-fix/fix-vscode.sh 91fa95bccb027ece6a968589bb1d662fa9c8e170
```

### Scenario 3: The "code" command doesn't use the fix

**Try this:**
```bash
# Check if alias is properly set
grep 'alias code=' ~/.bashrc

# If missing, add it back
echo 'alias code="~/.vscode-server-fix/fix-arch.sh && /mnt/c/Users/jirih/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"' >> ~/.bashrc
source ~/.bashrc
```

### Scenario 4: The fix script itself isn't working

**Try this:**
```bash
# Manual fix for a specific version
COMMIT_ID=$(code --version | head -1 2>/dev/null || echo "latest-commit-from-error")
mkdir -p ~/.vscode-server/bin/$COMMIT_ID
wget "https://update.code.visualstudio.com/commit:$COMMIT_ID/server-linux-x64/stable" -O /tmp/vscode-server.tar.gz
tar -xzf /tmp/vscode-server.tar.gz -C ~/.vscode-server/bin/$COMMIT_ID --strip-components=1
touch ~/.vscode-server/bin/$COMMIT_ID/vscode-server.tar.gz.done
```

### Scenario 5: VS Code updated and the problem returned

**Try this:**
```bash
# Fix architecture detection
mkdir -p ~/.vscode-server
echo "x64" > ~/.vscode-server/arch
find ~/.vscode-server -name "*legacy*" -delete 2>/dev/null
echo "false" > ~/.vscode-server/use-legacy-x64

# Run the fix script
~/.vscode-server-fix/fix-vscode.sh
```

## Advanced: How It Works

1. **Architecture Detection Override**
   - Forces VS Code to use "x64" instead of "legacy-x64"
   - Sets flags to prevent legacy mode activation

2. **Correct Server Download**
   - Downloads the standard x64 server version
   - Places files in the correct location
   - Creates completion markers VS Code expects

3. **Command Alias**
   - Ensures architecture fix runs before VS Code launches
   - Provides seamless experience when opening workspaces

## Technical Details

This issue occurs because:
- VS Code has certain architecture detection logic for older Linux systems
- WSL sometimes triggers the "legacy" detection incorrectly
- The legacy-x64 server packages are often unavailable, causing 404 errors

Our solution forces VS Code to use the standard x64 build, which is always available and compatible with modern WSL distributions.

## Important Files

- `~/.vscode-server-fix/fix-vscode.sh` - Main fix script
- `~/.vscode-server-fix/fix-arch.sh` - Architecture fix script
- `~/.vscode-server/arch` - Architecture override file
- `~/.vscode-server/bin/<commit-id>` - Server installation directories

This solution should persist through VS Code updates and provide a reliable workaround for the architecture detection issue.