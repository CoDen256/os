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
    ripgrep # faster grep


    # terminal navigation
    yazi
    zoxide # cd
    fzf # fuzzy finder
    tree

    # file management utils
    p7zip # 7z
    unzip
    unrar

    # system info
    lshw
    inxi
    neofetch


    # extra tools
    yt-dlp # audio and video downloader
  ];
}
