#! /bin/bash

echo Start setting up Look\'n feel.

echo Setting up fonts ...
/usr/bin/dconf write /org/gnome/desktop/interface/font-name "'Source Sans Pro 11'"
/usr/bin/dconf write /org/gnome/desktop/interface/document-font-name "'Source Sans Pro 11'"
/usr/bin/dconf write /org/gnome/desktop/interface/monospace-font-name "'Source Code Pro Medium 11'"
/usr/bin/dconf write /org/gnome/desktop/interface/text-scaling-factor 1.0
/usr/bin/dconf write /org/gnome/settings-daemon/plugins/xsettings/antialiasing "'rgba'"
/usr/bin/dconf write /org/gnome/settings-daemon/plugins/xsettings/hinting "'slight'"

echo Setting up icon set ...
/usr/bin/dconf write /org/gnome/desktop/interface/icon-theme "'Faenza-Darkest'"

echo Done setting up Look\'n feel.
