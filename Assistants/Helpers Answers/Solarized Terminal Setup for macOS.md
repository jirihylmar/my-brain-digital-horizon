# Solarized Terminal Setup for macOS

```yaml
Author: :person_jirihylmar
Updated: 2025-05-14T07:39:50Z
Purpose:
- Instructions for installing the Solarized Dark theme for Terminal in macOS
- Configuring syntax highlighting and other useful features
Keywords:
- macOS
- Terminal
- Solarized Dark
- Oh My Zsh
- syntax highlighting
```

## Quick Installation

Copy and paste this command into your Terminal:

```bash
rm -rf ~/Downloads/terminal-themes && mkdir -p ~/Downloads/terminal-themes && cd ~/Downloads/terminal-themes && curl -L https://github.com/tomislav/osx-terminal.app-colors-solarized/archive/master.zip -o solarized.zip && unzip solarized.zip && cd osx-terminal.app-colors-solarized-master && open "Solarized Dark.terminal" && sleep 2 && defaults write com.apple.Terminal "Default Window Settings" -string "Solarized Dark" && defaults write com.apple.Terminal "Startup Window Settings" -string "Solarized Dark" && killall cfprefsd && if [ ! -d ~/.oh-my-zsh ]; then sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; fi && if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting; fi && if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions; fi && cp ~/.zshrc ~/.zshrc.backup && if grep -q "plugins=(" ~/.zshrc; then if ! grep -q "zsh-syntax-highlighting" ~/.zshrc; then awk -i inplace '/plugins=\(/ {gsub(/plugins=\((.*)\)/, "plugins=(\1 zsh-syntax-highlighting zsh-autosuggestions)")} {print}' ~/.zshrc; fi; else echo 'plugins=(git zsh-syntax-highlighting zsh-autosuggestions)' >> ~/.zshrc; fi && echo 'PROMPT="%F{green}%n@%m%f %F{blue}%~%f $ "' >> ~/.zshrc && echo 'export CLICOLOR=1' >> ~/.zshrc && echo 'export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd' >> ~/.zshrc && echo 'alias ls="ls -G"' >> ~/.zshrc && echo 'alias ll="ls -lG"' >> ~/.zshrc && echo 'alias la="ls -laG"' >> ~/.zshrc && cd ~/ && rm -rf ~/Downloads/terminal-themes && echo "✅ Installation complete! Please run 'source ~/.zshrc' to apply changes."
```

After installation, run:
```bash
source ~/.zshrc
```

## What This Installs

1. **Solarized Dark Theme** - A popular, eye-friendly dark theme
2. **Oh My Zsh** - A framework for managing Zsh configuration
3. **Command Syntax Highlighting** - Commands appear green when valid, red when invalid
4. **Auto-suggestions** - Fish-like suggestions as you type
5. **Custom Prompt** - Shows username, hostname, and current directory
6. **Colored ls output** - File listings with color coding

## Benefits

- **Reduced Eye Strain** - The scientifically-designed Solarized color scheme reduces eye fatigue
- **Improved Readability** - Carefully selected colors provide good contrast
- **Enhanced Productivity** - Syntax highlighting helps catch typos before executing commands
- **Better Navigation** - Colored file listings make it easier to identify file types

## Customization

Your original Terminal settings are backed up to `~/.zshrc.backup`. To customize:

1. Edit `~/.zshrc` with your preferred text editor
2. Modify the `PROMPT` line to change your prompt appearance
3. Add more aliases for commands you frequently use

## Troubleshooting

If you encounter issues:

1. **Terminal looks wrong**: Quit Terminal completely (Cmd+Q) and restart it
2. **Commands not highlighted**: Run `source ~/.zshrc` to reload settings
3. **Original settings needed**: Copy back your backup with `cp ~/.zshrc.backup ~/.zshrc`

## Credits

- [Solarized](https://ethanschoonover.com/solarized/) by Ethan Schoonover
- [Oh My Zsh](https://ohmyz.sh/)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)