gives="xfce4-dynamic-workspaces"
pkgname="${gives}-rs-bin"
pkgdesc="Dynamic workspaces for XFCE, similar to GNOME"
pkgver="0.2.0"
arch=("arm64" "amd64")
source=("${gives}::https://github.com/rhino-linux/${gives}/releases/download/${pkgver}/${gives}-${CARCH}")
sha256sums_amd64=("87726bd225fed29d5030b5c69a06e2785c5e81b541eeeb83185cbfb83a87f073")
sha256sums_arm64=("ffe69b4f0fdcac2e74284b6948b71988bc88a0c9105422b5f639733c1475bec8")
provides=("${gives}-plugin")
replaces=("${provides[@]}")
conflicts=("${provides[@]}")
depends=("libwnck-3-0" "libwnck-3-dev")
maintainer=("Elsie19 <hwengerstickel@pm.me>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/etc/skel/.config/autostart/"
  echo "[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Type=Application
Name=Dynamic Workspaces
Comment=Dynamic Workspaces for XFCE
Exec=${gives}
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
