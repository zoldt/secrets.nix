# The only place that reads `inputs`.
inputs:
inputs.flake-parts.lib.mkFlake {
  inherit inputs;
  # Modules ask for the inputs they use by name (`{sops-nix, ...}:`).
  specialArgs = inputs;
} {
  imports = [
    inputs.flake-parts.flakeModules.modules
    (inputs.import-tree ../modules)
  ];

  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    formatter = pkgs.alejandra;
  };
}
