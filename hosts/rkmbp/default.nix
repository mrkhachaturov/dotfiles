# The Looking Glass
# System configuration for my work Macbook

{
  inputs,
  globals,
  overlays,
  ...
}:

inputs.darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { };
  modules = [
    ../../modules/common
    ../../modules/darwin
    (
      globals
      // rec {
        user = "mrkhachaturov";
        gitName = "mrkhachaturov";
        # gitEmail = "${user}@take2games.com";
      }
    )
    inputs.home-manager.darwinModules.home-manager
    inputs.mac-app-util.darwinModules.default
    {
      nixpkgs.overlays = overlays;
      networking.hostName = "rkmbp";
      # identityFile = "/Users/mrkhachaturov/.ssh/id_ed25519";
      gui.enable = true;
      theme = {
        colors = (import ../../colorscheme/gruvbox-dark).dark;
        dark = true;
      };
      mail.user = globals.user;
      charm.enable = true;
      neovim.enable = true;
      kitty.enable = true;
      discord.enable = true;
      dotfiles.enable = true;
      terraform.enable = true;
      python.enable = true;
      rust.enable = true;
      lua.enable = true;
      obsidian.enable = true;
      kubernetes.enable = true;
      _1password.enable = true;
      slack.enable = true;
      wezterm.enable = true;
      yt-dlp.enable = true;
    }
  ];
}
