{ pkgs, username, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git curl wget
    eza bat fd ripgrep fzf zoxide thefuck
    neovim lazygit gh jq yq
    rustup nodejs_22
    awscli2 terraform docker
    tmux tree pandoc
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
    casks = [
      "raycast"
      "wezterm"
      "chromium"
      "mac-mouse-fix"
    ];
    taps = [ "jesseduffield/lazygit" ];
    brews = [
      "pyenv"
      "pyenv-virtualenv"
      "rbenv"
      "gimme-aws-creds"
      "powerlevel10k"
      "zsh-syntax-highlighting"
      "zsh-autosuggestions"
    ];
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = false;
    };
    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.4;
        orientation = "bottom";
        show-recents = false;
        tilesize = 48;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        FXPreferredViewStyle = "Nlsv";
        FXEnableExtensionChangeWarning = false;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
      };
      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
    };
  };

  programs.zsh.enable = true;
  system.stateVersion = 5;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };
}
