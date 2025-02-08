{
  pkgs ? import <nixpkgs> { },
}:
let
  pname = "key-combiner";
  version = "0.8.0";

  src = pkgs.fetchurl {
    url = "https://keycombiner.com/download/KeyCombiner-0.8.0.AppImage";
    hash = "sha256-N3NI4gfFYU1gDKDKLaWI/XggbqUs19EV18oAhrF5u/8=";
  };

  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
  };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: with pkgs; [ ];
}
