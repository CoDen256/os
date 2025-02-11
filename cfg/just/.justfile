rest:
  ~/os/nix/init.sh

unstow PACKAGE:
  stow --dir=$HOME/os/cfg --target=$HOME/ -D {{PACKAGE}}

restsec:
  ~/sec/init.sh

unstowsec PACKAGE:
  stow --dir $HOME/sec/home --target=$HOME/ -D {{PACKAGE}}

maven-home:
  stow --dir $HOME/sec/home --target=$HOME/ -D maven-ome
  
maven-ome:
  ~/sec/init.sh

readb:
  adb kill-server
  adb start-server

reb:
  nh os switch ~/os/nix
  @#sudo nixos-rebuild switch --flake ~/os/nix#deimos

ul QUERY:
  ulauncher-toggle || true
  sleep 0.01
  ydotool type '{{QUERY}} '