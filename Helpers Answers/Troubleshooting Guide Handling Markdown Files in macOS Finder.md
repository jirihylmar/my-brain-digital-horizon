# Troubleshooting Guide Handling Markdown Files in macOS Finder

## Overview of the Problem

Markdown (.md) files in macOS Finder may display with a special icon (often a blue downward arrow with a VSCode logo) and their preview may show rendered/formatted content instead of plain text like regular .txt files. This guide explains how to make Markdown files display as plain text in Finder's preview pane and QuickLook.

## Prerequisites and Installation Procedures

### 1. Install Homebrew (if not already installed)

Homebrew is needed to install duti and QuickLook plugins.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install duti

duti is a command-line utility to set default applications for file types.

```bash
brew install duti
```

### 3. Install QuickLook Extensions (Optional)

If you want to use QuickLook extensions for Markdown (for formatted viewing):

```bash
# Option 1: Install QLMarkdown
brew install --cask qlmarkdown

# Option 2: Install PreviewMarkdown
# Available on Mac App Store
```

## Solution Methods

### Method 1: Check Current File Associations

First, check which application is currently associated with Markdown files:

```bash
duti -x md
```

This will show the default application, bundle ID, and path. Example output:
```
TextEdit
/System/Applications/TextEdit.app
com.apple.TextEdit
```

### Method 2: Set TextEdit as Default Handler

To make Markdown files behave like text files:

```bash
duti -s com.apple.TextEdit .md all
```

### Method 3: Disable or Configure QuickLook Extensions

If you have Markdown-specific QuickLook extensions installed:

1. Go to System Settings > General > Login Items & Extensions
2. Scroll down to Extensions
3. Click on the (ⓘ) icon next to "Quick Look"
4. Find and disable any Markdown-related extensions (like "Markdown Previewer" or "QLMarkdown")
5. Restart Finder with: `killall Finder`

If you prefer to keep the extension but see raw text:

1. Open QLMarkdown application from Applications folder
2. Look for settings/preferences option
3. Enable the "Show plain text file (raw version)" option

### Method 4: Rebuild LaunchServices Database (Advanced)

If the above methods don't help:

```bash
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
```

### Method 5: Clear Icon Caches

Sometimes clearing icon caches helps:

```bash
# Clear Finder icon caches
sudo rm -rfv /Library/Caches/com.apple.iconservices.store
sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \;
sudo find /private/var/folders/ -name com.apple.iconservices -exec rm -rf {} \;

# Restart necessary services
killall Dock
killall Finder
```

## Verification and Testing

After making changes, test by:

1. Selecting a Markdown file in Finder
2. Looking at the Preview pane - it should now show raw Markdown text
3. Or press Space to use QuickLook - it should show plain text content

## UTI (Uniform Type Identifier) Information

macOS identifies file types using UTIs. For Markdown files, you can check the UTI with:

```bash
mdls -name kMDItemContentType /path/to/your/file.md
```

Common UTIs for Markdown files:
- `dyn.ah62d4rv4ge8043a` (dynamic UTI)
- `net.daringfireball.markdown` (standard Markdown UTI)

## Permissions Management

If QuickLook plugins ask for permission to access documents:

1. Go to System Settings > Privacy & Security > Full Disk Access
2. Add the QuickLook application to the list
3. Enable its access

Alternatively, for specific folder access only:
1. Go to System Settings > Privacy & Security > Files and Folders
2. Find the application requesting access
3. Enable access to specific folders

## Troubleshooting Notes

1. VSCode often registers as a handler for Markdown files, which can affect how they appear in Finder
2. Multiple QuickLook extensions might conflict with each other
3. Some macOS versions may handle QuickLook differently
4. The behavior might change after system updates
5. Default macOS behavior without extensions should display raw text
6. If you want to restore formatted preview later, you can re-enable the QuickLook extensions

## References

- duti documentation: https://github.com/moretension/duti
- QLMarkdown: https://github.com/sbarex/QLMarkdown
- PreviewMarkdown: Available on Mac App Store