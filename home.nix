{ config, pkgs, ... }:

let
  zjstatus = pkgs.fetchurl {
    url = "https://github.com/dj95/zjstatus/releases/download/v0.17.0/zjstatus.wasm";
    sha256 = "sha256-IgTfSl24Eap+0zhfiwTvmdVy/dryPxfEF7LhVNVXe+U=";
  };
  zellij_forgot = pkgs.fetchurl {
    url = "https://github.com/karimould/zellij-forgot/releases/download/0.4.2/zellij_forgot.wasm";
    sha256 = "sha256-MRlBRVGdvcEoaFtFb5cDdDePoZ/J2nQvvkoyG6zkSds=";
  };
  harpoon = pkgs.fetchurl {
    url = "https://github.com/Nacho114/harpoon/releases/download/v0.2.1/harpoon.wasm";
    sha256 = "sha256-J9KuuIP+tyjaNvC+B3dJFQhLQ0ye5WAnnvI6xLfuOOg=";
  };
in

{
  home.username = "dante";
  home.homeDirectory = "/home/dante";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    gotools
    gofumpt
    nodePackages.prettier
    golangci-lint
    eslint_d
    buf
    ruff
    pyright
    actionlint
    clippy
    nixfmt-rfc-style
    python3
    chafa
    gopls
    rust-analyzer
    nil
    typescript-language-server
    vscode-langservers-extracted
    svelte-language-server
    astro-language-server
    tailwindcss-language-server
    dockerfile-language-server
    yaml-language-server
    lua5_1
    luarocks
    gcc
    gnumake
    unzip
    nodejs_20
    stylua
    fd
    tree-sitter
    ffmpegthumbnailer
    imagemagick
    fontconfig
    p7zip
    poppler
  ];

  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."zellij/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zellij/config.kdl";
  xdg.configFile."zellij/layouts".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zellij/layouts";
  xdg.configFile."zellij/plugins/zjstatus.wasm".source = zjstatus;
  xdg.configFile."zellij/plugins/zellij_forgot.wasm".source = zellij_forgot;
  xdg.configFile."zellij/plugins/harpoon.wasm".source = harpoon;

  programs.git = {
    enable = true;
    settings = {
      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;

      window_padding_width = 10;
      background_opacity = "0.85";

      tab_bar_style = "hidden";

      confirm_os_window_close = 0;

      shell_integration = "enable";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    autocd = true;

    shellAliases = {
      nrs = "nh os switch --ask /etc/nixos";
      ll = "eza --icons --git";
      ls = "eza --icons --git";
      la = "eza -la --icons --git --group-directories-first";
      tree = "eza --tree --icons";
      nix-clean = "nh clean --all";
      cat = "bat";
      ip = "ip --color=auto";
      lsgens = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | fzf --tac --no-sort --header='History Generations of NixOS'";
      snvim = "sudoedit";
    };

    initContent = ''
      export PATH=$PATH:$HOME/.local/bin

      export MANPAGER="sh -c 'col -bx | bat -l man -p'"

      function mkcd() {
        mkdir -p "$1" && cd "$1"
      }
    '';

    history = {
      path = "${config.home.homeDirectory}/.zsh_history";
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
  };
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      scan_timeout = 10;
      directory = {
        truncation_length = 3;
      };
      character = {
        success_symbol = "[❯](bold purple)";
        error_symbol = "[❯](bold red)";
      };
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
  };
  xdg.configFile."yazi".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/yazi";

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      global = {
        log_filter = "^loading";
      };
    };
  };

}
