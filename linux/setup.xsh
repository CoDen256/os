#!/usr/bin/env xonsh

tool_dir=p"~/.local/bin"

aptrep("universe", "ppa:agornostal/ulauncher")
apti ulauncher

apti ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
extract("https://github.com/sxyazi/yazi/releases/download/v0.4.2/yazi-x86_64-unknown-linux-gnu.zip", p"/tmp/yazi")
sudo mv /tmp/yazi/yazi @(tool_dir)/yazi
sudo mv /tmp/yazi/ya @(tool_dir)/ya