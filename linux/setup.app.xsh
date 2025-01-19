#!/usr/bin/env xonsh

tool_dir=p"~/.local/bin"

# apt apps
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
aptrep("universe", "ppa:agornostal/ulauncher")
apti kitty gparted ulauncher timeshift steam notion-app

# deb apps
debi https://www.termius.com/download/linux/Termius.deb
debi https://downloads.slack-edge.com/desktop-releases/linux/x64/4.41.105/slack-desktop-4.41.105-amd64.deb

# AppImage apps
wget -P @(tool_dir) https://keycombiner.com/download/KeyCombiner-0.8.0.AppImage
wget -P @(tool_dir) https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/Obsidian-1.7.7.AppImage

### manual installs
# yazi
apti ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
extract("https://github.com/sxyazi/yazi/releases/download/v0.4.2/yazi-x86_64-unknown-linux-gnu.zip", p"/tmp/")
sudo mv /tmp/yazi-x*/yazi @(tool_dir)/yazi
sudo mv /tmp/yazi-x*/ya @(tool_dir)/ya

# OneDrive
apti build-essential libcurl4-openssl-dev libsqlite3-dev pkg-config git curl systemd-dev libnotify-dev
curl -fsS https://dlang.org/install.sh | bash -s dmd

# Barracudavpn
# needs prior login https://dlportal.barracudanetworks.com/download/6021/VPNClient_5.3.6_Linux.tar.gz
# manual download
aunpack ~/Downloads/VPNClient*.tar.gz
apti ~/Downloads/VPNClient*/*.deb

### appimaged
git clone git@github.com:CoDen256/go-appimage.git
cd go-appimage
scripts/build.sh
scripts/run.sh
cd ..
rm -rf go-appimage
