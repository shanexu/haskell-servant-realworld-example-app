{ mkDerivation, aeson, base, bytestring, containers, jwt, mtl
, servant, servant-server, sqlite-simple, stdenv, text, time, wai
, warp, nix-gitignore
}:
mkDerivation {
  pname = "haskell-servant-realworld-example-app";
  version = "0.0.1.0";
  src = nix-gitignore.gitignoreSourcePure [./.gitignore] ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base bytestring containers jwt mtl servant servant-server
    sqlite-simple text time wai warp
  ];
  homepage = "https://github.com/dorlowd/haskell-servant-realworld-example-app#readme";
  license = stdenv.lib.licenses.bsd3;
}
