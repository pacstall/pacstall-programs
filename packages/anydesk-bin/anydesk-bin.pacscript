name="anydesk-bin"
gives="anydesk"
breaks=("${gives}-deb")
replace=("${gives}")
repology=("project: ${gives}")
version="6.2.1"
url="https://download.anydesk.com/linux/${gives}-${version}-amd64.tar.gz"
depends=("libc6" "libgcc1" "libglib2.0-0" "libgtk2.0-0" "libstdc++6" "libx11-6" "libxcb-shm0" "libxcb1" "libpango1.0-dev" "libcairo2" "libxrandr2" "libx11-xcb1" "libxtst6" "libxfixes3" "libxdamage1" "libgtkglext1")
description="Platform independent remote access to personal computers and other devices running the host application - Binary version"
hash="96a7ded2144ecdaff381c34e49eee3275caaaac00847e91abf5e7783706c989c"
arch=('amd64')

install() {
  # Binary
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  # Polkit
  sudo mkdir -p "${pkgdir}/usr/share/polkit-1/actions"
  sudo mv "./polkit-1/com.anydesk.anydesk.policy" "${pkgdir}/usr/share/polkit-1/actions"
  # .desktop
  sudo install -Dm755 anydesk.desktop -t "${pkgdir}/usr/share/applications"
  # Systemd
  sudo mkdir -p "${pkgdir}/usr/share/anydesk/files/systemd"
  sudo mv "./systemd/anydesk.service" "${pkgdir}/usr/share/anydesk/files/systemd"
  # Init
  sudo mkdir -p "${pkgdir}/usr/share/anydesk/files/init"
  sudo mv "./init/anydesk" "${pkgdir}/usr/share/anydesk/files/init"
  # Icon
  sudo mkdir -p "${pkgdir}/usr/share/hicolor/"
  sudo mv "./icons/hicolor/"* "${pkgdir}/usr/share/hicolor/"
}

# vim:set ft=sh ts=2 sw=2 et:
