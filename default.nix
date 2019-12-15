let
  pkgs = (import ./pkgs.nix).pkgs;
in
pkgs.haskellPackages.haskell-servant-realworld-example-app
