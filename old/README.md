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
