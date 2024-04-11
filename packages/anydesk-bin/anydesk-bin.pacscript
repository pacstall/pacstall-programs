pkgname="anydesk-bin"
gives="anydesk"
breaks=("${gives}-deb")
replaces=("${gives}")
repology=("project: ${gives}")
pkgver="6.3.0"
source=("https://download.anydesk.com/linux/${gives}-${pkgver}-amd64.tar.gz")
depends=("libc6" "libgcc1" "libglib2.0-0" "libgtk2.0-0" "libstdc++6" "libx11-6" "libxcb-shm0" "libxcb1" "libpango1.0-dev" "libcairo2" "libxrandr2" "libx11-xcb1" "libxtst6" "libxfixes3" "libxdamage1" "libgtkglext1")
pkgdesc="Platform independent remote access to personal computers and other devices running the host application - Binary version"
sha256sums=("b1e3337d35ce19af93963829988b2014e8acfbbf6bd1b5adfb8bc7dcd6fee452")
arch=('amd64')

package() {
  cd "${_archive}"
  # Binary
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  # Polkit
  mkdir -p "${pkgdir}/usr/share/polkit-1/actions"
  mv "./polkit-1/com.anydesk.anydesk.policy" "${pkgdir}/usr/share/polkit-1/actions"
  # .desktop
  install -Dm755 anydesk.desktop -t "${pkgdir}/usr/share/applications"
  # Systemd
  mkdir -p "${pkgdir}/usr/share/anydesk/files/systemd"
  mv "./systemd/anydesk.service" "${pkgdir}/usr/share/anydesk/files/systemd"
  # Init
  mkdir -p "${pkgdir}/usr/share/anydesk/files/init"
  mv "./init/anydesk" "${pkgdir}/usr/share/anydesk/files/init"
  # Icon
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/"
  mv "./icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"
}

# vim:set ft=sh ts=2 sw=2 et:
