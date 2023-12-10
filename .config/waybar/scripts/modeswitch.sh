#!/bin/bash

CURRENT=$(readlink -f $HOME/.config/waybar/style.css)

if [[ $CURRENT == /home/komo/.config/waybar/stylesheets/dark.css ]]; then
	ln -sf $HOME/.config/waybar/stylesheets/light.css $HOME/.config/waybar/style.css
	ln -sf $HOME/.config/gtk-3.0/styles/light.ini $HOME/.config/gtk-3.0/settings.ini
	ln -sf $HOME/.config/foot/styles/lightfoot $HOME/.config/foot/foot.ini
	ln -sf $HOME/Pictures/Wallpapers/lightgear.jpg $HOME/Pictures/Wallpapers/curwall.jpg
else
	ln -sf $HOME/.config/waybar/stylesheets/dark.css $HOME/.config/waybar/style.css
	ln -sf $HOME/.config/gtk-3.0/styles/settings.ini $HOME/.config/gtk-3.0/settings.ini
	ln -sf $HOME/.config/foot/styles/darkfoot $HOME/.config/foot/foot.ini
	ln -sf $HOME/Pictures/Wallpapers/gears.jpg $HOME/Pictures/Wallpapers/curwall.jpg
fi
killall waybar
waybar
hyprctl reload
