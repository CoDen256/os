{
  pkgs ? import <nixpkgs> { },
}:
let
  version = "2.5.2";

  jar1 = pkgs.fetchurl {
    url = "https://bitbucket.org/JesusFreke/smali/downloads/baksmali-${version}.jar";
    sha256 = "sha256-0xFiSMzk+C7Fox63+V7nXa/0Ld9u7Qq1c5c9xT+60uU="; # Replace with the actual SHA-256 hash
  };

  # Fetch the second JAR file
  jar2 = pkgs.fetchurl {
    url = "https://bitbucket.org/JesusFreke/smali/downloads/smali-${version}.jar";
    sha256 = "sha256-lUQplXixb3cdiqjq7+DTcYygNHjBbzw1by/PE2a/sRY="; # Replace with the actual SHA-256 hash
  };
in
pkgs.stdenv.mkDerivation rec {
  pname = "smali";
  inherit version;

  src = [ jar1 jar2 ];

  nativeBuildInputs = with pkgs; [ makeWrapper ];
  unpackPhase = "true";
  installPhase = ''
    mkdir -p $out/bin $out/share/java
    cp ${jar1} $out/share/java/baksmali.jar
    cp ${jar2} $out/share/java/smali.jar

    makeWrapper ${pkgs.jre8}/bin/java $out/bin/baksmali \
      --add-flags "-jar $out/share/java/baksmali.jar"

    makeWrapper ${pkgs.jre8}/bin/java $out/bin/smali \
      --add-flags "-jar $out/share/java/smali.jar"
  '';
}
