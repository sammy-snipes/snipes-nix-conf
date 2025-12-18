{ pkgs, username, ... }:

{
  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";
    packages = with pkgs; [ duckdb ffmpeg mpv luarocks yarn ];
    file = {
      "Scripts" = { source = ./scripts; recursive = true; };
    };
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Sam Ellis";
    userEmail = "sam.ellis@example.com";  # UPDATE THIS
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
    aliases = { st = "status"; co = "checkout"; br = "branch"; ci = "commit"; };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = { size = 10000; save = 10000; ignoreDups = true; ignoreSpace = true; share = true; };
    oh-my-zsh = { enable = true; plugins = [ "git" ]; };
    shellAliases = {
      vim = "nvim";
      ls = "eza --icons=always -1";
      ll = "eza --icons=always -la";
      la = "eza --icons=always -a";
      lt = "eza --icons=always --tree";
      cd = "z";
      gcg = "git config --edit --global";
      gcl = "git config --edit --local";
      dwork = "docker run -dit --name temp-work -v $(pwd):/workspace -v ~/.aws:/root/.aws -v /var/run/docker.sock:/var/run/docker.sock dev-container && docker exec -it temp-work bash";
      dstop = "docker stop temp-work && docker rm temp-work";
      gsc = "bash gimme-sso-creds.sh";
      rebuild = "darwin-rebuild switch --flake ~/.config/nix-darwin";
      ftp = "lftp";
    };
    initExtra = ''
      source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      [[ -f ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh ]] && source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
      bindkey '^[[A' history-search-backward
      bindkey '^[[B' history-search-forward
      eval "$(zoxide init zsh)"
      eval "$(fzf --zsh)"
      eval "$(thefuck --alias)"
      eval "$(thefuck --alias fk)"
      export PYENV_ROOT="$HOME/.pyenv"
      [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init -)"
      eval "$(rbenv init - zsh)"
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
      [[ -f ~/.cargo/env ]] && source ~/.cargo/env
      [[ -f ~/.secrets.env ]] && source ~/.secrets.env
      export PATH=$HOME/Scripts:$PATH
    '';
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      AWS_DEFAULT_REGION = "us-west-2";
      WEZTERM_CONF_PATH = "~/.wezterm.lua";
    };
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")
      local config = wezterm.config_builder()
      config.font = wezterm.font("JetBrainsMono Nerd Font")
      config.font_size = 12
      config.use_fancy_tab_bar = false
      config.tab_bar_at_bottom = true
      config.window_decorations = "RESIZE"
      config.color_scheme = "Catppuccin Mocha"
      config.window_background_opacity = 0.95
      return config
    '';
  };

  programs.zoxide = { enable = true; enableZshIntegration = true; };
  programs.fzf = { enable = true; enableZshIntegration = true; };
  programs.bat = { enable = true; config = { theme = "Catppuccin Mocha"; }; };
  programs.eza = { enable = true; icons = "auto"; };
}
