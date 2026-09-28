#!/bin/env bash
echo "Installing dependencies..."
sudo pacman -S waybar swaybg wf-recorder wl-clipboard slurp grim ttf-jetbrains-mono-nerd noto-fonts-cjk noto-fonts-emoji zip lf unzip pavucontrol --noconfirm
echo "Checking directories..."
mkdir -p ~/.config
mkdir -p /home/$USER/Pictures/Screenshots
mkdir -p /home/$USER/Videos/records
mkdir -p ~/.local/share/icons
echo "Configuring..."
cp -r fastfetch ~/.config
cp -r wofi ~/.config
cp -r dunst ~/.config
cp -r hypr ~/.config
cp -r waybar ~/.config
cp -r kitty ~/.config
cp -r lf ~/.config
echo "Installing cursor"
cp -r cursor/* ~/.local/share/icons
echo "Refreshing fonts"
fc-cache -fv
echo "Installing wallpapers..."
cp -r wallpaper /home/$USER/Pictures/
hyprctl reload
echo "Setup completed." 
echo "Restart your hyprland (SUPER + M) for a Better Experience."

