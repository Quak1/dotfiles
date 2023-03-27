## WSL
- Install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
```sh
wsl --install
```

- [Hack NF](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
- [Overnight Slumber](https://windowsterminalthemes.dev/?theme=Overnight%20Slumber) Theme

## Git
- Install git
```sh
sudo apt update && sudo apt upgrade
sudo apt-get install git
```

- Generate a SSH key
```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

- Add SSH key to ssh-agent
```sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

- Add key to [account](https://github.com/settings/keys)
```sh
cat ~/.ssh/id_ed25519.pub
```

- Test connection (github)
```sh
ssh -T git@github.com
```


## [Nvim](https://github.com/neovim/neovim) setup
- Installation
```sh
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
```
- Uninstall
```sh
sudo apt -y purge neovim
```

- Install `build-essential` ([Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) requirement)

Some lean Ubuntu/Debian distributions (like Docker containers or the "minimal" versions) doesn't include build tools like gcc & its friends. So, the easiest & by the far the most convenient way to get a C Compiler installed (and working) is to install the build essentials package.
```sh
sudo apt-get update && sudo apt-get install build-essential
```

- Install [Packer](https://github.com/wbthomason/packer.nvim#quickstart)
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ```


## zsh setup
```sh
sudo apt install zsh
chsh -s $(which zsh)
```

- Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation)
```sh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
- Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Dotbot
- Run dotbot: `./install`
  - Can update dotbot with: `git submodule update --remote dotbot`

## Node
- Install [nvm](https://github.com/nvm-sh/nvm)
```sh
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```
- Verify installation
```sh
command -v nvm
```

- Install desired version of node
```sh
nvm ls
nvm ls-remote
nvm install --lts
nvm install node
```

- Verify node installation
```sh
node --version
npm --version
```

- Change between node versions
```sh
nvm use --lts
nvm use node
nvm use v8.2.1
```
