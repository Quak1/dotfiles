## Install Nvim
- [Nvim](https://github.com/neovim/neovim)
```sh
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
```

- Install build-essential ([Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) requirement)
Some lean Ubuntu/Debian distributions (like Docker containers or the "minimal" versions) doesn't include build tools like gcc & its friends. So, the easiest & by the far the most convenient way to get a C Compiler installed (and working) is to install the build essentials package.
```sh
sudo apt-get update && sudo apt-get install build-essential
```

- Install [Packer](https://github.com/wbthomason/packer.nvim#quickstart)
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ```
 

- Install zsh
```sh
sudo apt install zsh
chsh -s $(which zsh)
```

- Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation)
- Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
- Run dotbot: `./install`
  - Can update dotbot with: `git submodule update --remote dotbot`
