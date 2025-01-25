#!/usr/bin/env xonsh

LD_LIBRARY_PATH=`/nix/store/.*libvdpau-va.*\d/lib/vdpau` + `/nix/store/.*libglvnd.*\d/lib` + `/nix/store/.*mesa.*/lib/` + `/nix/store/.*glxindirect/lib`
# or just `/nix/store/.*mesa.*drivers/lib/` ?
print(":".join(LD_LIBRARY_PATH))

LIBGL_DRIVERS_PATH=`/nix/store/.*mesa.*/lib/dri`
# or just `/nix/store/.*mesa.*drivers/lib/dri` ?
print(":".join(LIBGL_DRIVERS_PATH))

#put in ~/.profile
#paths=$(xonsh /home/coden/.config/xonsh/.profile)
#export LD_LIBRARY_PATH=$(echo $paths | head -n1)
#export LIBGL_DRIVERS_PATH=$(echo $paths | tail -n1)