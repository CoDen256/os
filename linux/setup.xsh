#!/usr/bin/env xonsh
print("hella")

aptrep("universe", "ppa:agornostal/ulauncher")
apti ulauncher

apti ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
curl -sSL https://github.com/sxyazi/yazi/releases/download/v0.4.2/yazi-x86_64-unknown-linux-gnu.zip -o ~/yazi.zip