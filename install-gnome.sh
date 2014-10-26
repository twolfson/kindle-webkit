#!/usr/bin/env bash
# Set up target directory
install_dir="/usr/local/lib/kindle-webkit"

# If we are not installed via symlink, do so
if ! test -d "$install_dir"; then
  sudo ln -s "$PWD" "$install_dir"
# Otherwise, inform the user of the status
else
  echo "Google Music Webkit already symlinked to /usr/local/lib. Continuing with next steps..." 1>&2
fi

# Overwrite existing Google Music Webkit application
applications_dir="$HOME/.local/share/applications"
mkdir -p "$applications_dir"
cat > "$applications_dir/kindle-webkit.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=nw $install_dir/
Icon[en_US]=$install_dir/lib/icon.png
Name[en_US]=Kindle Webkit
Icon=$install_dir/lib/icon.png
Name=Kindle Webkit
Comment=Open Kindle Webkit
EOF

# Notify user of completion
echo "Google Music Webkit successfully installed!"
