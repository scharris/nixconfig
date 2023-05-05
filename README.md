# Home Manager Configuration

Install Nix.
Install Home manager.
Enable experimental nix command and flakes.
Checkout this repo to `$HOME/home-manager` and symlink from `~/.config/home-manager`.
  (I don't think location actually matters anymore since flake is being used.)


## Update packages
```sh
nix-channel --update
```

## Apply updates made to `home.nix` or `flake.nix`:

Linux:
```sh
cd $HOME/home-manager && home-manager switch --flake .#linux
```

MacOS:
```sh
cd $HOME/home-manager && home-manager switch --flake .#mac
```

Or, on any host after installing Home Manager (and enabling experimental flakes):

Linux:
```sh
home-manager switch --flake github:scharris/nixconfig#linux
```

MacOS:
```sh
home-manager switch --flake github:scharris/nixconfig#mac
```

