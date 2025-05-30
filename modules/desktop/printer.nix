{ pkgs, inputs, config, ... }:

{
  # Printing services
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip
    ];
  };
}

