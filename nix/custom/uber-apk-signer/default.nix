{
  pkgs ? import <nixpkgs> { },
}:
let
in
pkgs.stdenv.mkDerivation rec {
  pname = "uber-apk-signer";
  version = "1.3.0";
  src = pkgs.fetchurl {
    url = "https://github.com/patrickfav/uber-apk-signer/releases/download/v${version}/uber-apk-signer-${version}.jar";
    sha256 = "sha256-4Smf1vz02lJ91Tc1tWEn6OqSKjIRKBI7nDLWGbuh2DU=";
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
