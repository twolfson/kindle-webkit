#!/usr/bin/env bash
# Set up target directory
install_dir="/usr/local/lib/kindle-webkit"

# If we are not installed via symlink, do so
if ! test -d "$install_dir"; then
  sudo ln -s "$PWD" "$install_dir"
# Otherwise, inform the user of the status
else
  echo "Kindle Webkit already symlinked to /usr/local/lib. Continuing with next steps..." 1>&2
fi

# Overwrite existing Kindle Webkit application
applications_dir="$HOME/.local/share/applications"
mkdir -p "$applications_dir"
cat > "$applications_dir/kindle-webkit.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=nw $install_dir/
Name[en_US]=Kindle Webkit
Name=Kindle Webkit
Comment=Open Kindle Webkit
EOF

# Notify user of completion
echo "Kindle Webkit successfully installed!"
