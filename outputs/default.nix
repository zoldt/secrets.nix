inputs:
inputs.flake-parts.lib.mkFlake {inherit inputs;} {
  imports = [
    inputs.flake-parts.flakeModules.modules
    (inputs.import-tree ../modules)
  ];

  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    formatter = pkgs.alejandra;
  };
}
