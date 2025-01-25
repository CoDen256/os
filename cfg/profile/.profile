# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# Added by Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

paths=$(xonsh $HOME/.config/xonsh/.profile)
export LD_LIBRARY_PATH=$(echo $paths | head -n1)
export LIBGL_DRIVERS_PATH=$(echo $paths | tail -n1)
#export LD_LIBRARY_PATH=/nix/store/ig15xf5f92rcnvm3ygs5hxjfys8sz93x-mesa-24.3.3-drivers/lib:/nix/store/7vaizallp9ianpgc2k05pcxl81l8gsjc-mesa-24.3.3-drivers/lib:/nix/store/dg5h0df1dw75lv62b1nvaf4pjxz7f19q-libvdpau-va-gl-0.4.2/lib/vdpau:/nix/store/qlpp4vynh3spggl15k2fq6kg467yi5d6-libvdpau-va-gl-0.4.2/lib/vdpau:/nix/store/hagnkdgmsxaq4aail4yz0wn7583v8aa7-mesa_glxindirect/lib:/nix/store/5mb70vg3kdzkyn0zqdgm4f87mdi0yi4i-libglvnd-1.7.0/lib:/nix/store/ig15xf5f92rcnvm3ygs5hxjfys8sz93x-mesa-24.3.3-drivers/lib:/nix/store/7vaizallp9ianpgc2k05pcxl81l8gsjc-mesa-24.3.3-drivers/lib:/nix/store/dg5h0df1dw75lv62b1nvaf4pjxz7f19q-libvdpau-va-gl-0.4.2/lib/vdpau:/nix/store/qlpp4vynh3spggl15k2fq6kg467yi5d6-libvdpau-va-gl-0.4.2/lib/vdpau:/nix/store/hagnkdgmsxaq4aail4yz0wn7583v8aa7-mesa_glxindirect/lib:/nix/store/5mb70vg3kdzkyn0zqdgm4f87mdi0yi4i-libglvnd-1.7.0/lib
#export LIBGL_DRIVERS_PATH=/nix/store/ig15xf5f92rcnvm3ygs5hxjfys8sz93x-mesa-24.3.3-drivers/lib/dri:/nix/store/7vaizallp9ianpgc2k05pcxl81l8gsjc-mesa-24.3.3-drivers/lib/dri