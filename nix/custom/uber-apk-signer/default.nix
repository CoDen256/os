{
  pkgs ? import <nixpkgs> { },
}:

let
  maven = pkgs.maven.override {
    mavenVersion = "3.8.7";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "uber-apk-signer";
  version = "1.4.2";
  src = pkgs.fetchFromGitHub {
    owner = "patrickfav";
    repo = "uber-apk-signer";
    rev = "a74efe039537e0e64ab0cbe284c4050b96d13018"; # e.g., "v1.0.0" or "a1b2c3d"
    sha256 = pkgs.lib.fakeHash;
  };

  buildInputs = [
    maven
    pkgs.jdk8
  ];

  buildPhase = ''
    # Run Maven build
    mvn clean install
  '';

  installPhase = ''
    # Copy the built artifact to the output directory
    mkdir -p $out
    cp target/*.jar $out/
  '';
}
