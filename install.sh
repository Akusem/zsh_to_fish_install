# Install zsh
sudo apt install zsh curl

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Download Fish like extension
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=1
ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme

# Activate plugins
sed -i -e 's/plugins=(git)/plugins=(git zsh-autosuggestions history-substring-search zsh-syntax-highlighting)/' ~/.zshrc

# Activate theme
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/' ~/.zshrc

# Ensure that Ctrl+Backspace delete previous word in every terminal
echo "bindkey '^H' backward-kill-word" >> ~/.zshrc

# Install LazyDocker 
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Change default shell
sudo chsh --shell /bin/zsh $USER

# Reload terminal
zsh
