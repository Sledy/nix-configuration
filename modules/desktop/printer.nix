{ pkgs, inputs, config, ... }:

{ 
# Enable CUPS to print documents.
  services.printing = {
     enable = true;
     drivers = with pkgs; [
     hplip
     ];
  };
  services.avahi.enable = true;
}

