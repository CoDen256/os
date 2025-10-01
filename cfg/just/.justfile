rest:
  ~/os/nix/init.sh

unstow PACKAGE:
  stow --dir=$HOME/os/cfg --target=$HOME/ -D {{PACKAGE}}

restsec:
  ~/sec/init.sh

unstowsec PACKAGE:
  stow --dir $HOME/sec/home --target=$HOME/ -D {{PACKAGE}}

mvnhome:
  ~/sec/mvn.sh home
  
mvnome:
  ~/sec/mvn.sh ome

readb:
  adb kill-server
  adb start-server

reb:
  nh os switch ~/os/nix
  @#sudo nixos-rebuild switch --flake ~/os/nix#deimos


dotest PROJECT TAG="latest":
    docker pull coden256/{{PROJECT}}:{{TAG}} || true
    docker run -it --entrypoint=/bin/bash coden256/{{PROJECT}}:{{TAG}} || docker run -it --entrypoint=/bin/sh coden256/{{PROJECT}}:{{TAG}}

[no-cd]
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

dodeploy TARGET PROJECT TAG="latest": (doundeploy TARGET PROJECT TAG)
    ssh root@{{TARGET}} "docker pull coden256/{{PROJECT}}:{{TAG}} && docker run -d coden256/{{PROJECT}}:{{TAG}}"