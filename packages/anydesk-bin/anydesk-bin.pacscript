name="anydesk-bin"
gives="anydesk"
breaks=("${gives}-deb")
replaces=("${gives}")
repology=("project: ${gives}")
pkgver="6.3.0"
source=("https://download.anydesk.com/linux/${gives}-${pkgver}-amd64.tar.gz")
depends=("libc6" "libgcc1" "libglib2.0-0" "libgtk2.0-0" "libstdc++6" "libx11-6" "libxcb-shm0" "libxcb1" "libpango1.0-dev" "libcairo2" "libxrandr2" "libx11-xcb1" "libxtst6" "libxfixes3" "libxdamage1" "libgtkglext1")
pkgdesc="Platform independent remote access to personal computers and other devices running the host application - Binary version"
hash=("b1e3337d35ce19af93963829988b2014e8acfbbf6bd1b5adfb8bc7dcd6fee452")
arch=('amd64')

package() {
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
  sudo mkdir -p "${pkgdir}/usr/share/icons/hicolor/"
  sudo mv "./icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"
}

# vim:set ft=sh ts=2 sw=2 et:
