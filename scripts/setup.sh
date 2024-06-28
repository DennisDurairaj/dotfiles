#~/bin/bash
# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	apt-get update
	apt-get install -y git
	apt-get install -y fzf
	apt-get install -y curl
	# zsh
	apt-get install -y zsh
	chsh -s $(which zsh)
	# zoxide
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
	# ripgrep
	apt-get install ripgrep
	# fd
	apt-get install fd-find
	# WezTerm
	curl -fsSL https://apt.fury.io/wez/gpg.key | gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
	echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | tee /etc/apt/sources.list.d/wezterm.list
	apt-get update
	apt-get install wezterm
	# lazygit
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	install lazygit /usr/local/bin

# Mac
elif [[ "$OSTYPE" == "darwin"* ]]; then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install git
	brew install jesseduffield/lazygit/lazygit
	brew install fzf
	brew install zoxide
	brew install ripgrep
	brew install --cask wezterm
fi

# OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-syntax-highlighting
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
cd zsh-syntax-highlighting/themes/
mkdir -p ~/.zsh/
cp -v catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
rm -rf zsh-syntax-highlighting
