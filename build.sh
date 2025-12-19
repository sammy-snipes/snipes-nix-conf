#!/bin/bash
cd ~/.config/nix-darwin
nix --extra-experimental-features 'nix-command flakes' build '.#darwinConfigurations.MacBook-Pro.system'
sudo ./result/sw/bin/darwin-rebuild switch --flake .
