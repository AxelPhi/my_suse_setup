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

echo Setting up themes ...
## New place for Gnome 3.10
mkdir -p ~/.local/share/themes
## Old place. Link to new. May show duplicate entries in tweak tool.
THEMES_DIR="/usr/share/themes/"
ZUKITWO_UNPACK="/tmp/zukitwo-unpack"
mkdir -p ${ZUKITWO_UNPACK}
unzip -d ${ZUKITWO_UNPACK} assets/zukitwo_by_lassekongo83-d3df2ot.zip
sudo cp -r ${ZUKITWO_UNPACK}/Zukitwo* ${THEMES_DIR}
sudo chown -R root:root ${THEMES_DIR}/Zukitwo* 
sudo find ${THEMES_DIR} -type d -exec chmod 775 {} \;
rm -r ${ZUKITWO_UNPACK}
/usr/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'Zukitwo'"
/usr/bin/dconf write /org/gnome/desktop/wm/preferences/theme "'Zukitwo'"

echo Done setting up Look\'n feel.

