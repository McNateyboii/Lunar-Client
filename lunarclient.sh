#!/bin/bash
FLAG=".script_ran"
if [ ! -f "$FLAG" ]; then
sudo apt install fuse
sudo apt install libnss3
sudo apt install nano
mkdir .local/share/applications
touch ~/.local/share/applications/lunar.desktop
cat <<EOF > ~/.local/share/applications/lunar.desktop
[Desktop Entry]
Name=Lunar Client
Exec=
Icon=
Terminal=false
Type=Application
EOF
chmod +x lunar.desktop
ICON_FILE=$(realpath "$(find -maxdepth 1 -type f -name "*.png")")
DESKTOP_FILE=$(find ".local/share/applications" -type f -name "*.desktop")
EXEC_FILE=$(realpath "$(find -name "lunarclient.sh")")
sed -i "s|^Icon=.*|Icon=$ICON_FILE|" "$DESKTOP_FILE"
sed -i "s|^Exec=.*|Exec=$EXEC_FILE|" "$DESKTOP_FILE"
touch "$FLAG"
fi
NAME=(*.AppImage)
SRC="$NAME"
DEST="Lunar-Client/$NAME"
if [[ ! -f "$DEST" ]]; then
    cp "$SRC" "$DEST"
fi
chmod +x "$SRC"
chmod +x "$DEST"
exec "$DEST"


