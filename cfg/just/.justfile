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


dobuild PROJECT TAG="latest":
    docker build {{PROJECT}} -t coden256/{{PROJECT}}:{{TAG}}

dorun PROJECT TAG="latest":
    docker run -d coden256/{{PROJECT}}:{{TAG}}

dopush PROJECT TAG="latest":
    docker push coden256/{{PROJECT}}:{{TAG}}

doundeploy TARGET PROJECT TAG="latest":
    #!/usr/bin/env bash
    set -euxo pipefail
    target=`ssh root@{{TARGET}} "docker ps -a -q --filter ancestor=coden256/{{PROJECT}} --format='{{{{.ID}}'"`
    echo Removing $target
    ssh root@{{TARGET}} "docker stop $target || true"
    ssh root@{{TARGET}} "docker rm $target || true"

dodeploy TARGET PROJECT TAG="latest": (undeploy TARGET PROJECT TAG)
    ssh root@{{TARGET}} "docker pull coden256/{{PROJECT}}:{{TAG}} && docker run -d coden256/{{PROJECT}}:{{TAG}}"