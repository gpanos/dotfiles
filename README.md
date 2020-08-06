# Dotfiles
My personal Mac preferences. This repository helps me setup and maintain my Mac.
Inspired and heavily copied [Dries](https://github.com/driesvints/dotfiles) and [Mathias](https://github.com/mathiasbynens/dotfiles) awesome dotfiles!

## Mac setup 

1. Install Xcode from the App Store
2. Install macOS Command Line Tools by running `xcode-select --install`
3. [Generate a new public and private SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add them to Github
4. Clone this repo to `~/.dotfiles`
5. Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#getting-started)
6. Execute `fresh.sh` 
7. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
8. Restart your computer to finalize the process
