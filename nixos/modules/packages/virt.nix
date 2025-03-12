{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # -- virtualization --
    libvirt
    qemu
    spice-vdagent
    virt-manager
    virt-viewer
  ];
}
