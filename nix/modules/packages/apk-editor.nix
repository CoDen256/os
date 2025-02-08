{
  pkgs ? import <nixpkgs> { },
}:
let
  newJdk = pkgs.jdk8;
  stdenv = pkgs.stdenv;
  gradleWithJdk8 = pkgs.gradle.override {
    jdk = jdk8;
  };
in
stdenv.mkDerivation rec {
  pname = "apk-editor";
  version = "1.4.2";
  src = pkgs.fse {
    owner = "REAndroid";
    repo = "APKEditor";
    rev = "20384128aa4dea282472d0e47fc6082939ccc8ea";
    sha256 = "sha256-vjGeRbm0Ib3xFZ9xdH/DjvTJ2AJf/Hnvq7br3gs8Rmc=";
  };

  nativeBuildInputs = with pkgs; [
    newJdk
    bash
    gradleWithJdk8
    makeWrapper

  ];

  configurePhase = ''
    chmod +x ./gradlew
  '';

  buildPhase = ''
    gradle fatJar
  '';

  installPhase = ''
    install -Dm644 build/libs/*.jar $out/lib/${pname}.jar
    mkdir -p $out/bin
    makeWrapper ${pkgs.jre}/bin/java $out/bin/${pname} \
      --add-flags "-jar $out/lib/${pname}.jar"
  '';
}
