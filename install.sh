# install zsh
sudo apt install zsh curl

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Download Fish like extension
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Activate plugins
sed -i -e 's/plugins=(git)/plugins=(git zsh-autosuggestions history-substring-search zsh-syntax-highlighting)/' ~/.zshrc

# Activate theme
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/' ~/.zshrc

# Change default shell
chsh --shell /bin/zsh $USER

# Reload terminal
source ~/.zshrc