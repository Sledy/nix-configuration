{ config, pkgs, ... }:

{
  services.flatpak.enable = true;
  programs.nix-ld.enable = true; # Required for running the generic linux binaries

  environment.systemPackages = with pkgs; [

    ### Editors
    vim                       # Terminal text editor
    logseq            	      # Knowledge management and note-taking app
    libreoffice-qt6-fresh # Documents editor, MS office substitute

    ### File Utilities
    file              # Determines file type
    which             # Shows full path of shell commands
    tree              # Displays directory tree
    gthumb            # Image viewer and organizer
    gnused            # GNU implementation of `sed`
    gnutar            # GNU implementation of `tar`
    gawk              # GNU implementation of `awk`
    zstd              # Fast compression algorithm
    gnupg             # Encryption and signing tool

    ### Password managers
    keepassxc

    ### Development Tools
    jetbrains-toolbox # Installs and manages JetBrains IDEs
    git               # Distributed version control system
    jq                # Command-line JSON processor
    yq-go             # YAML processor based on Go
    dbeaver-bin       # Database management tool
    postman           # API Development Environment

    ### Multimedia Tools
    mpv               # Media player
    celluloid         # GTK player for mpv
    obs-studio        # Screen recorder and streaming tool
    veracrypt         # Disk encryption utility

    ### Network Tools
    mtr               # Network diagnostics combining ping and traceroute
    iperf3            # Network bandwidth measurement tool
    dnsutils          # Contains `dig` and `nslookup`
    ldns              # Includes `drill`, a DNS lookup tool
    aria2             # Lightweight command-line download manager
    socat             # Network tool for data relay
    nmap              # Network scanning and auditing tool
    ipcalc            # IP subnet calculator
    iftop             # Network bandwidth monitoring tool

    ### System Monitoring & Debugging
    htop              # Interactive process viewer
    btop              # Resource monitor with a modern UI
    iotop             # I/O usage monitoring tool
    strace            # Traces system calls and signals
    ltrace            # Traces library calls
    lsof              # Lists open files
    sysstat           # System performance monitoring tools
    lm_sensors        # Shows hardware sensor data
    ethtool           # Configures Ethernet devices

    ### Archive & Compression Tools
    zip               # Zip file compressor
    unzip             # Extracts zip files
    p7zip             # 7z archive tool

    ### Command-line UX Enhancements
    ripgrep           # Fast recursive search tool (like grep)
    eza               # Modern replacement for `ls`
    fzf               # Fuzzy file finder
    neofetch          # System info in terminal
    glow              # Terminal markdown viewer

    ### Nix & System Management
    nix-output-monitor # Enhances output of Nix commands
    pciutils          # Includes `lspci` to inspect PCI devices
    usbutils          # Includes `lsusb` to inspect USB devices
    gnome-control-center # GNOME system settings UI

    ### Web browsers
    firefox

    ### Backup solution
    timeshift
    deja-dup

    ### Productivity Apps
    pomodoro-gtk      # Pomodoro timer

    ### Communication
    slack
  ];
}

