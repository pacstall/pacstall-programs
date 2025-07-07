pkgname="xfce-dynamic-workspaces-rs-git"
gives="xfce4-dynamic-workspaces-plugin"
pkgdesc="Dynamic workspaces for XFCE, similar to GNOME"
source=("https://github.com/Elsie19/xfce-dynamic-workspaces.git")
provides=("xfce4-dynamic-workspaces-plugin")
replaces=("xfce4-dynamic-workspaces-plugin")
conflicts=("xfce4-dynamic-workspaces-plugin")
arch=("any")
pkgver="0.1.0"
depends=("libwnck-3-0" "libwnck-3-dev")
makedepends=("cargo>=1.85.0" "pkg-config" "libwnck-3-0" "libwnck-3-dev")
maintainer=("Elsie19 <hwengerstickel@pm.me>")
external_connection=true

build() {
  cd "xfce-dynamic-workspaces"
  cargo build --release --locked
}

package() {
  cd "xfce-dynamic-workspaces"
  install -Dm755 "target/release/xfce-dynamic-workspace" -t "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/etc/skel/.config/autostart/"
  echo "[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Type=Application
Name=Dynamic Workspaces
Comment=Dynamic Workspaces for XFCE
Exec=xfce-dynamic-workspace
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false" | tee "${pkgdir}/etc/skel/.config/autostart/dynamic_workspaces.desktop" > /dev/null
}

post_install() {
  mkdir -p "${homedir}/.config/autostart"
  if ! [[ -f "${homedir}/.config/autostart/dynamic_workspaces.desktop" ]]; then
    sudo cp "/etc/skel/.config/autostart/dynamic_workspaces.desktop" "${homedir}/.config/autostart/dynamic_workspaces.desktop"
  fi
}

post_remove() {
  if [[ -L "${homedir}/.config/autostart/dynamic_workspaces.desktop" ]]; then
    sudo rm -f "${homedir}/.config/autostart/dynamic_workspaces.desktop"
  fi
}
