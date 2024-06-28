#~/bin/bash
apt-get update
echo "Installing xz"
apt-get install -y xz-utils
echo "Installing curl"
apt-get install -y curl

echo "Installing nix"
sh <(curl -L https://nixos.org/nix/install) --daemon
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

cat ~/.config/home-manager/home.nix
