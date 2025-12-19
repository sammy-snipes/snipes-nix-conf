{ pkgs, username, ... }:

{
  nix.enable = false;  # Using Determinate Nix installer

  system.primaryUser = username;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git curl wget
    eza bat fd ripgrep fzf zoxide
    neovim lazygit gh jq yq
    rustup nodejs_22
    awscli2 terraform docker
    tmux tree pandoc
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "none";  # Safe mode: won't remove unlisted packages. Change to "zap" later.
    };
    casks = [
      "raycast"
      "wezterm"
      "chromium"
      "mac-mouse-fix"
      "karabiner-elements"
      "font-jetbrains-mono-nerd-font"
      "font-inter"
      "font-atkinson-hyperlegible"
      "docker"
      "obsidian"
      "cursor"
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
      "postgresql@14"
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
        orientation = "left";
        show-recents = false;
        tilesize = 48;
        magnification = true;
        largesize = 32;
        launchanim = false;
        mineffect = "scale";
        # Hot corners: 14 = Quick Note
        wvous-br-corner = 14;
      };
      screencapture = {
        location = "~/Desktop/screenshots";
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
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        "com.apple.swipescrolldirection" = false;  # Unnatural scroll direction
      };
      trackpad = {
        Clicking = false;
        TrackpadThreeFingerDrag = false;
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
