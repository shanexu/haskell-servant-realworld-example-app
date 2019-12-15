let
  inherit (import ./pkgs.nix) pkgs all-hies;
in
pkgs.haskellPackages.shellFor {
  name = "haskell-servant-realworld-example-app-nix-shell";
  packages = p: [ p.haskell-servant-realworld-example-app ];
  buildInputs = [
    pkgs.bashInteractive
    pkgs.cabal-install
    pkgs.stack
    pkgs.haskellPackages.apply-refact
    pkgs.haskellPackages.hlint
    pkgs.haskellPackages.stylish-haskell
    pkgs.haskellPackages.hasktags
    pkgs.haskellPackages.hoogle
    pkgs.haskellPackages.hindent
    (all-hies.selection { selector = p: { inherit (p) ghc865; }; })
  ];
}
