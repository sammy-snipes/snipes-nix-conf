# Sam's nix-darwin Configuration

One command to set up a new Mac with all my tools, configs, and preferences.

## What's Included

**Apps (via Homebrew):** raycast, wezterm, chromium, docker, obsidian, karabiner, mac-mouse-fix

**Dev Tools (via Nix):** neovim, git, gh, lazygit, tmux, docker, terraform, awscli, ripgrep, fzf, bat, eza, fd, zoxide

**Languages:** rustup, nodejs, pyenv, rbenv

**Configs synced:**
- Neovim, Karabiner, WezTerm, tmux
- Zsh (oh-my-zsh + powerlevel10k + catppuccin theme)
- Git (separate work/personal identities)
- SSH hosts, AWS profiles

**macOS settings:** dark mode, dock (left, autohide, magnify), fast key repeat, screenshots to ~/Desktop/screenshots, and more

---

## First-time Setup (New Machine)

```bash
# 1. Install Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# 2. Clone config (use HTTPS first, no SSH keys yet)
git clone https://github.com/sammy-snipes/snipes-nix-conf.git ~/.config/nix-darwin

# 3. Bootstrap (installs everything)
nix run nix-darwin -- switch --flake ~/.config/nix-darwin

# 4. Restart terminal, then set up secrets
cp ~/.config/nix-darwin/.secrets.env.example ~/.secrets.env
nvim ~/.secrets.env
```

That's it. Everything else is automatic.

---

## Post-Setup (Manual Steps)

1. **SSH Keys** - Copy from backup or regenerate (see below)
2. **Raycast** - Import config: Raycast → Settings → Advanced → Import → `raycast/Raycast.rayconfig`
3. **AWS Auth** - Run `gsc` to authenticate via SSO
4. **Git remote** - Switch to SSH: `cd ~/.config/nix-darwin && git remote set-url origin git@github.com:sammy-snipes/snipes-nix-conf.git`

---

## Rebuild After Changes

```bash
rebuild
# or: darwin-rebuild switch --flake ~/.config/nix-darwin
```

---

## SSH Keys

Copy from secure backup or regenerate. All keys go in `~/.ssh/` with `chmod 600`.

```bash
# Generate a new key
ssh-keygen -t ed25519 -f ~/.ssh/KEY_NAME -C "sam@machine"

# Fix permissions
chmod 600 ~/.ssh/KEY_NAME
chmod 644 ~/.ssh/KEY_NAME.pub
```

| Key | Purpose | Where to add public key |
|-----|---------|------------------------|
| `hanzomain` | GitHub personal (sammysnipes) | github.com → Settings → SSH Keys |
| `komodo_new` | GitHub work (sam-h-ellis) | github.com (work account) → Settings → SSH Keys |
| `nix_key` | NixOS server | `~/.ssh/authorized_keys` on NixOS box |
| `droplet_ssh_key` | DigitalOcean droplet | DigitalOcean console |
| `norwood_ec2` | Norwood AWS EC2 | EC2 instance or AWS console |
| `shanes_marmot` | Marmot server (work) | Get from Shane |

### Git Identity (automatic)

Repos in `~/Desktop/Work/` use work identity (sam-h-ellis).
Repos in `~/Desktop/Personal/` use personal identity (sammysnipes).
