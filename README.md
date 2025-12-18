# Sam's nix-darwin Configuration

## First-time Setup (New Machine)

```bash
# Install Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Clone config
git clone git@github.com:YOUR_USER/snipes-nix-conf.git ~/.config/nix-darwin

# Bootstrap
nix run nix-darwin -- switch --flake ~/.config/nix-darwin

# Set up secrets
cp ~/.config/nix-darwin/.secrets.env.example ~/.secrets.env
vim ~/.secrets.env
```

## Rebuild after changes

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin
# or just: rebuild
```

## Not managed by nix (copy manually)
- `~/.secrets.env` - API keys
- `~/.config/nvim/` - Neovim config (separate git repo)
- `~/.p10k.zsh` - Powerlevel10k config (backup in extras/)
- Raycast settings (export from Raycast → Settings → Advanced → Export)
