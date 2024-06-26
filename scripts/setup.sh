#~/bin/bash
# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	apt-get update
	apt-get install -y git
	apt-get install -y fzf
	apt-get install -y curl
	apt-get install -y zsh
	chsh -s $(which zsh)
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Mac
elif [[ "$OSTYPE" == "darwin"* ]]; then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install git
	brew install fzf
	brew install zoxide
fi

# OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-syntax-highlighting
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
cd zsh-syntax-highlighting/themes/
mkdir -p ~/.zsh/
cp -v catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
rm -rf zsh-syntax-highlighting