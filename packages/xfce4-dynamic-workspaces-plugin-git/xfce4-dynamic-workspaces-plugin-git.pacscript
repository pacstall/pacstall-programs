pkgname="xfce4-dynamic-workspaces-plugin-git"
source=("https://github.com/DimseBoms/XFCE-Dynamic-Workspace.git")
arch=("all")
pkgver="0.0.1"
pkgrel="3"
gives="xfce4-dynamic-workspaces-plugin"
replaces=("xfce4-dynamic-workspaces")
conflicts=("${replaces[@]}")
depends=("python3-gi" "libwnck-3-0" "wmctrl" "gir1.2-notify-0.7")
pkgdesc="Dynamic workspaces for XFCE, similar to GNOME"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  install -Dm755 "XFCE-Dynamic-Workspace/dynamic_workspaces.py" -t "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/etc/skel/.config/autostart"
  echo "[Desktop Entry]
Encoding=UTF-8
Version=0.0.1
Type=Application
Name=Dynamic Workspaces
Comment=Dynamic Workspaces for XFCE
Exec=dynamic_workspaces.py
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false" | tee "${pkgdir}/etc/skel/.config/autostart/dynamic_workspaces.desktop" > /dev/null
}

post_install() {
  mkdir -p "${homedir}/.config/autostart"
  sudo rm -f "${homedir}/.config/autostart/dynamic_workspaces.desktop"
  sudo cp "/etc/skel/.config/autostart/dynamic_workspaces.desktop" "${homedir}/.config/autostart/dynamic_workspaces.desktop"
}

post_upgrade() {
  mkdir -p "${homedir}/.config/autostart"
  if ! [[ -f "${homedir}/.config/autostart/dynamic_workspaces.desktop" ]]; then
    sudo cp "/etc/skel/.config/autostart/dynamic_workspaces.desktop" "${homedir}/.config/autostart/dynamic_workspaces.desktop"
  fi
}

post_remove() {
  if [[ -f "${homedir}/.config/autostart/dynamic_workspaces.desktop" ]]; then
    sudo rm -f "${homedir}/.config/autostart/dynamic_workspaces.desktop"
  fi
}
