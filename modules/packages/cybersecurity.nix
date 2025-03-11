{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # === HACKING / SECURITY TOOLS ===
    aircrack-ng
    ffuf
    ghidra
    gobuster
    john
    metasploit
    netcat-openbsd
    nmap
    ropgadget
    sqlmap
    thc-hydra
    social-engineer-toolkit
    wireshark
    wordlists

    # === SOFTWARE DEFINED RADIO (SDR) ===
    pkg-config
    rtl-sdr
    rtl-sdr-librtlsdr
    sdrpp
  ];
}

