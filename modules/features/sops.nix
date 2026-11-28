{inputs, ...}: {
  flake.modules.nixos.sops =
    # sops-nix, decrypting with the host's age key. Hosts set
    # `sops.defaultSopsFile` and declare the `sops.secrets` their services use.
    {lib, ...}: {
      imports = [inputs.sops-nix.nixosModules.sops];

      sops = {
        age = {
          keyFile = lib.mkDefault "/var/lib/age/key.txt";
          sshKeyPaths = lib.mkDefault [];
        };
        gnupg.sshKeyPaths = lib.mkDefault [];
      };
    };
}
