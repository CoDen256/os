rest:
  ~/os/nix/init.sh

restsec:
  ~/sec/init.sh

readb:
  adb kill-server
  adb start-server

unstow PACKAGE:
  stow --dir=$HOME/os/cfg --target=$HOME/ -D {{PACKAGE}}

reb:
    sudo nixos-rebuild switch --flake ~/os/nix#deimos

rebold:
    sudo nixos-rebuild switch --flake ~/rudra#default