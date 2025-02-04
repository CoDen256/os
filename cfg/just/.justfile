rest:
  ~/os/nixos/init.sh

reb:
    sudo nixos-rebuild switch --flake ~/os/nixos#default

rebold:
    sudo nixos-rebuild switch --flake ~/rudra#default