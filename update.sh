#!/usr/bin/env bash

# Function to copy folders
copy_folders() {
    for folder in "$@"; do
        if [ -d "/home/ianfeldman/.config/$folder" ]; then
            rsync -av --delete "/home/ianfeldman/.config/$folder" ".config"
            echo "Copied $folder"
        else
            echo "Error: $folder does not exist or is not a directory."
        fi
    done
}

# Copy the specified folders
copy_folders "$@"
# Copy vim 
cp /home/ianfeldman/.vimrc .vimrc
# Copy nix config
cp /etc/nixos/configuration.nix configuration.nix

git status
