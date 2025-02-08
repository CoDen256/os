rest:
  ~/os/nix/init.sh

restsec:
  ~/sec/init.sh

unstowsec PACKAGE:
  stow --dir $HOME/sec/home --target=$HOME/ -D {{PACKAGE}}


readb:
  adb kill-server
  adb start-server

unstow PACKAGE:
  stow --dir=$HOME/os/cfg --target=$HOME/ -D {{PACKAGE}}

reb:
  nh os switch ~/os/nix
  #sudo nixos-rebuild switch --flake ~/os/nix#deimos