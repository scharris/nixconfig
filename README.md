# Home Manager Configuration

## Update packages
```sh
nix-channel --update
```

## Apply updates made to `home.nix` or `flake.nix`:

```sh
cd $HOME/.config/nixpkgs && home-manager switch --flake .#macs
```

Or, on any host after installing Home Manager (and enabling experimental flakes):

```sh
home-manager switch --flake github:scharris/nixconfig#macs
```

