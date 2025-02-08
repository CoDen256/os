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

   extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/keycombiner.desktop $out/share/applications/keycombiner.desktop
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/keycombiner.png \
      $out/share/icons/hicolor/512x512/apps/keycombiner.png
    substituteInPlace $out/share/applications/keycombiner.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
  '';
}
