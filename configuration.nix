{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # --- System Identity & Versioning ---
  system.stateVersion = "25.11"; 

  networking.hostName = "jrac"; 
  networking.networkmanager.enable = true;

  networking.firewall.enable = true; 

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  # --- Localization ---
  time.timeZone = "America/Caracas";
  i18n.defaultLocale = "en_US.UTF-8";

  # --- Boot & Kernel ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # --- Hardware & Bluetooth ---
  hardware.enableAllFirmware = true;
  
  hardware.graphics.enable = true;

  fonts.fontconfig.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Experimental = true;
      FastConnectable = true;
    }; 
    settings.Policy = {
      AutoEnable = true;
    };
  };

  # --- Nix Package Manager Configuration ---
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;

  # --- Desktop Environment (Plasma 6 on Wayland) ---
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;
  
  # Keyboard layout for X11/Wayland compatibility
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  # --- Audio & Services ---
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true; # PulseAudio compatibility
    jack.enable = true;  # JACK compatibility for Ardour
    alsa.enable = true;
  };
  services.printing.enable = true;
  services.tailscale = {
    enable = true;
    extraUpFlags = ["--operator=dante"];
  };

  # --- Virtualization Stack ---
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = false; # We use Podman as Podman
      defaultNetwork.settings.dns_enabled = true;
    };
    docker = {
      enable = true;
      daemon.settings = {
        dns = ["1.1.1.1" "8.8.8.8"];
	log-driver = "journald";
	registry-mirrors = ["https://mirror.grc.io"];
	storage-driver = "overlay2";
      };
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  programs.zsh.enable = true;

  # --- User Configuration ---
  users.users.dante = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" 
      "networkmanager" 
      "docker" 
      "podman" 
      "video" 
      "audio"
    ];
    shell = pkgs.zsh;
  };

  # --- System Packages ---
  environment.systemPackages = with pkgs; [
    # 1. CORE UTILITIES (Stable)
    git
    github-cli
    lazygit
    bruno        # API Client
    ngrok
    wget
    unzip
    unrar
    ripgrep      # Fast search
    fd           # Better find
    btop         # Resource monitor
    dua          # Disk usage analyzer
    wl-clipboard # Wayland clipboard
    tldr         # Simplified man pages
    yazi         # File Manager
    neofetch
    nixfmt-rfc-style
    dua
    usbutils
    dig
    dnslookup
    bat
    fzf
    buildah
    jq
    eza
    dive
    ctop
    nix-output-monitor
    nh

    # 2. GUI APPLICATIONS (Stable)
    obsidian
    thunderbird
    foliate
    mpv
    ffmpeg-full
    ardour         # Audio workstation
    libreoffice-qt
    
    google-chrome
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    
    # 3. KDE CUSTOMIZATION
    kdePackages.qtstyleplugin-kvantum
    papirus-icon-theme
    papirus-folders
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/etc/nixos";
  };

  environment.plasma6.excludePackages = with pkgs; ([
    kdePackages.elisa
    kdePackages.kate
    kdePackages.konsole
  ]);

  # --- Shells & Programs ---
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.mtr.enable = true;

  programs.ssh.enableAskPassword = true;
}
