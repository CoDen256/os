{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    git
    just
    stow

    wget
    curl
    busybox

    eza # ls
    bat # cat 
    ripgrep # grep recursive


    # terminal navigation
    yazi
    zoxide
    fzf
    tree

    # file management utils
    progress # progress of mv and cp commands
    p7zip # 7z
    unzip
    unrar
  ];
}
