{
  pkgs ? import <nixpkgs> { },
}:
let
in
pkgs.stdenv.mkDerivation rec {
  pname = "apk-editor";
  version = "1.4.2";
  src = pkgs.fetchurl {
    url = "https://github.com/REAndroid/APKEditor/releases/download/V${version}/APKEditor-${version}.jar";
    sha256 = "sha256-dY8vkVP/+WwgJgsXfwJaPKPOzJd3q91DE5oX4iVyRhI=";
  };

  nativeBuildInputs = with pkgs; [ makeWrapper ];
  unpackPhase = "true";
  installPhase = ''
    mkdir -p $out/bin $out/share/java
    cp $src $out/share/java/${pname}.jar

    makeWrapper ${pkgs.jre8}/bin/java $out/bin/${pname} \
      --add-flags "-jar $out/share/java/${pname}.jar"
  '';
}
