pkgname="xfce4-dynamic-workspaces-plugin-git"
source=("https://github.com/DimseBoms/XFCE-Dynamic-Workspace.git")
arch=("all")
pkgver="0.0.1"
gives="xfce4-dynamic-workspaces-plugin"
depends=("python3-gi" "libwnck-3-0" "wmctrl" "gir1.2-notify-0.7")
pkgdesc="Dynamic workspaces for XFCE, similar to GNOME"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  install -Dm755 "XFCE-Dynamic-Workspace/dynamic_workspaces.py" -t "${pkgdir}/usr/bin"
}
