{
  description = "Sam's nix-darwin + home-manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager }:
  let
    system = "aarch64-darwin";
    username = "sam.ellis";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs username; };
      modules = [
        ./darwin
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit inputs username; };
          home-manager.users.${username} = import ./home;
        }
      ];
    };

    apps.${system}.rebuild = {
      type = "app";
      program = toString (pkgs.writeShellScript "rebuild" ''
        darwin-rebuild switch --flake ~/.config/nix-darwin
      '');
    };
  };
}
