{
  nixConfig.extra-substituters = [
    "https://bytecodealliance.cachix.org"
    "https://wasmcloud.cachix.org"
    "https://nixify.cachix.org"
    "https://crane.cachix.org"
    "https://nix-community.cachix.org"
  ];
  nixConfig.extra-trusted-substituters = [
    "https://bytecodealliance.cachix.org"
    "https://wasmcloud.cachix.org"
    "https://nixify.cachix.org"
    "https://crane.cachix.org"
    "https://nix-community.cachix.org"
  ];
  nixConfig.extra-trusted-public-keys = [
    "bytecodealliance.cachix.org-1:0SBgh//n2n0heh0sDFhTm+ZKBRy2sInakzFGfzN531Y="
    "wasmcloud.cachix.org-1:9gRBzsKh+x2HbVVspreFg/6iFRiD4aOcUQfXVDl3hiM="
    "nixify.cachix.org-1:95SiUQuf8Ij0hwDweALJsLtnMyv/otZamWNRp1Q1pXw="
    "crane.cachix.org-1:8Scfpmn9w+hGdXH/Q9tTLiYAE/2dnJYRJP7kl80GuRk="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  ];

  inputs.nixify.url = "github:rvolosatovs/nixify";
  inputs.wrpc.inputs.nixify.follows = "nixify";
  inputs.wrpc.url = "github:bytecodealliance/wrpc/v0.14.0";

  outputs = {
    nixify,
    wrpc,
    ...
  }:
    with nixify.lib;
      rust.mkFlake {
        src = ./.;
        name = "{{ project-name }}";

        overlays = [
          wrpc.overlays.default
        ];

        excludePaths = [
          ".gitignore"
          "flake.nix"
          "README.md"
        ];

        targets.aarch64-apple-darwin = false;
        targets.aarch64-linux-android = false;
        targets.aarch64-unknown-linux-gnu = false;
        targets.aarch64-unknown-linux-musl = false;
        targets.arm-unknown-linux-gnueabihf = false;
        targets.arm-unknown-linux-musleabihf = false;
        targets.armv7-unknown-linux-gnueabihf = false;
        targets.armv7-unknown-linux-musleabihf = false;
        targets.powerpc64le-unknown-linux-gnu = false;
        targets.riscv64gc-unknown-linux-gnu = false;
        targets.s390x-unknown-linux-gnu = false;
        targets.wasm32-unknown-unknown = false;
        targets.wasm32-wasip1 = false;
        targets.x86_64-apple-darwin = false;
        targets.x86_64-pc-windows-gnu = false;
        targets.x86_64-unknown-linux-gnu = false;
        targets.x86_64-unknown-linux-musl = false;

        clippy.deny = ["warnings"];
        clippy.workspace = true;

        test.allTargets = true;
        test.workspace = true;

        withDevShells = {
          devShells,
          pkgs,
          ...
        }:
          extendDerivations {
            buildInputs = [
              pkgs.wrpc
            ];
          }
          devShells;
      };
}
