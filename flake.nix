{
  description = "A nodejs project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Application configuration
      config = rec {
        # Generic
        appName = "React Geo App";
        imageName = "react-geo-app";

        containerTargets = [
          { nixSystem = "aarch64-linux"; dockerArch = "arm64"; }
          { nixSystem = "x86_64-linux"; dockerArch = "amd64"; }
          { nixSystem = "aarch64-darwin"; dockerArch = "arm64"; }
          { nixSystem = "x86_64-darwin"; dockerArch = "amd64"; }
        ];

        # Environment specific
        development = {
          envMap = {
            PUBLIC_APP_TITLE = appName + " (DEV)";
            PUBLIC_PRESENCE_ALIAS = "Lars G";
            PUBLIC_PRESENCE_ADDRESS = "https://github.com/larsgkodehode";
          };
        };
        production = {
          envMap = {
            PUBLIC_APP_TITLE = appName;
            PUBLIC_PRESENCE_ALIAS = "Lars G";
            PUBLIC_PRESENCE_ADDRESS = "https://github.com/larsgkodehode";
          };
        };
      };

      # Helper for creating attribute sets for multiple targets
      allSupportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSupportedSystems = nixpkgs.lib.genAttrs allSupportedSystems;
    in
    {
      # Development environment
      devShells = forEachSupportedSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.nodejs_22

              # For repository scripts and misc
              pkgs.just
              pkgs.jq
              pkgs.gnutar
            ];

            env = config.development.envMap;
          };
        }
      );

      # Build artifacts
      packages = forEachSupportedSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };

          # Currently this needs to be manually updated whenever the package-lock.json changes
          npmLockfileHash = "sha256-QPzEk3Bwe0lzGDvBlRqrh54YRqaMK2jcaWHOTeDptKA=";
        in
        rec {
          default = frontendAssets;

          # The static asset bundle for the application
          frontendAssets = pkgs.buildNpmPackage {
            name = config.appName;

            buildInputs = [
              pkgs.nodejs_22
            ];

            env = config.production.envMap;

            src = ./applications/map;
            npmDepsHash = npmLockfileHash;

            npmBuild = "npm run build";

            installPhase = ''
              mkdir -p $out
              cp -r dist/* $out
            '';
          };

          # Container Image
          container = nixpkgs.lib.genAttrs (map (target: target.nixSystem) config.containerTargets (target:
              let
                targetPkgs = import nixpkgs { system = target.nixSystem; };
                webBinary = "${targetPkgs.static-web-server}/bin/static-web-server";
              in pkgs.dockerTools.buildImage {
                # Any references to package from a nix/store inside here
                # will be included in the container image
                name = "${config.imageName}-${target.arch}";

                config.Cmd = [ webBinary "--root" frontendAssets ];

                architecture = target.arch;
              }
            )
          );
        }
      );
    };
}
