let
  all-hies = import (fetchTarball {
    url = "https://github.com/infinisil/all-hies/archive/8d9b0e770c8e2264ef4882623a205548d9fdaa03.tar.gz";
    sha256 = "1lqvyn3as7wp4njdk4hl34qiwbnys192shv425jvw27014hgl3vy";
  }) { };

  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          haskell-servant-realworld-example-app = haskellPackages.callPackage ./haskell-servant-realworld-example-app.nix { };
          jwt = haskellPackages.callPackage ./jwt.nix { };
        };
      };
    };
  };

  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/14c1a446d88f6a5369098af2f7e884969085f14d.tar.gz";
    sha256 = "0psqh1g5zzh5c6yg1qfg1l3bzpr92sphk6rs88qv6kgx83a4dyxh";
  }) { inherit config; };

in
{ inherit all-hies pkgs;
}

