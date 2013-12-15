#! /bin/bash

echo Setting up fonts ...
/usr/bin/dconf write /org/gnome/desktop/interface/font-name "'Source Sans Pro 11'"
/usr/bin/dconf write /org/gnome/desktop/interface/document-font-name "'Source Sans Pro 11'"
/usr/bin/dconf write /org/gnome/desktop/interface/monospace-font-name "'Source Code Pro Medium 11'"
/usr/bin/dconf write /org/gnome/desktop/interface/text-scaling-factor 1.0

echo Setting up icon set ...
/usr/bin/dconf write /org/gnome/desktop/interface/icon-theme "'Faenza-Darkest'"


