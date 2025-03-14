#!/bin/bash
sudo apt install fuse
sudo apt install libnss3
sudo apt install nano
mkdir .local/share/applications
mkdir run
touch ~/.local/share/applications/lunar.desktop
cat <<EOF > ~/.local/share/applications/lunar.desktop
[Desktop Entry]
Name=Lunar Client
Exec=full.sh
Icon=black.png
Terminal=false
Type=Application
EOF
chmod +x lunar.desktop
ICON_FILE=$(find -maxdepth 1 -type f -name "*.png")
ICON_FILE=$(realpath "$ICON_FILE")
DESKTOP_FILE=$(find ".local/share/applications" -type f -name "*.desktop")
EXEC_FILE=$(find -name "full.sh")
EXEC_FILE=$(realpath "$EXEC_FILE")
sed -i "s|^Icon=.*|Icon=$ICON_FILE|" "$DESKTOP_FILE"
sed -i "s|^Exec=.*|Exec=$EXEC_FILE|" "$DESKTOP_FILE"
