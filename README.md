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

## Not managed by nix (manual steps)
- `~/.secrets.env` - Copy from `.secrets.env.example` and fill in API keys
- Raycast settings: Import from `raycast/Raycast.rayconfig` via Raycast → Settings → Advanced → Import
- AWS credentials: Run `gsc` (gimme-sso-creds) after setup to authenticate

## SSH Keys

Either copy from secure backup or regenerate. All keys go in `~/.ssh/` with `chmod 600`.

```bash
# Generate a new key (ed25519 recommended)
ssh-keygen -t ed25519 -f ~/.ssh/KEY_NAME -C "sam@machine"

# Fix permissions if needed
chmod 600 ~/.ssh/KEY_NAME
chmod 644 ~/.ssh/KEY_NAME.pub
```

| Key | Purpose | Where to add public key |
|-----|---------|------------------------|
| `hanzomain` | GitHub personal (sammysnipes) | github.com → Settings → SSH Keys |
| `komodo_new` | GitHub work (sam-h-ellis) | github.com (work account) → Settings → SSH Keys |
| `nix_key` | NixOS server (sammysnipes-nixos.duckdns.org) | `~/.ssh/authorized_keys` on NixOS box |
| `droplet_ssh_key` | DigitalOcean droplet | DigitalOcean console or `/root/.ssh/authorized_keys` |
| `norwood_ec2` | Norwood AWS EC2 | EC2 instance or reimport via AWS console |
| `shanes_marmot` | Marmot server (work) | Get from Shane or regenerate + add to server |

### GitHub SSH (optional multi-account setup)

If using multiple GitHub accounts, uncomment the hosts in `~/.ssh/config` and clone with:
```bash
git clone git@github.com-sammy-snipes:user/repo.git  # personal
git clone git@github.com-sam-h-ellis:user/repo.git   # work
```
