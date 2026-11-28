# secrets.nix

How Zoldt's hosts get their secrets. The encrypted secrets themselves live in a
separate, private repository.

Import `inputs.zoldt-secrets.modules.nixos.default` for sops-nix with the age key at
`/var/lib/age/key.txt`, then set `sops.defaultSopsFile` and declare `sops.secrets`
in the modules that use them.
