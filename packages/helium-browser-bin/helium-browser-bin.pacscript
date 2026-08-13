pkgname="helium-browser-bin"
gives="helium-browser"
pkgver="0.15.3.1"
pkgdesc="Private, fast, and honest web browser based on Chromium"
maintainer=("tranquil-tr0 <tranquil-tr0@proton.me>")
arch=('amd64' 'arm64')
url='https://github.com/imputnet/helium-linux'
license=('GPL-3.0-only' 'BSD-3-Clause')
depends=('libgtk-3-0t64' 'libnss3' 'libasound2t64' 'xdg-utils' 'libxss1' 'libcups2' 'libgcrypt20'
  'fonts-liberation' 'systemd' 'dbus' 'libpulse0' 'pciutils' 'libva2'
  'libffi8' 'desktop-file-utils' 'hicolor-icon-theme' 'ca-certificates')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: support for native dialogs in Plasma'
  'libgtk-4-1: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
  'gnome-keyring: password storage backend on GNOME / Xfce'
  'kwallet6: support for storing passwords in KWallet on Plasma'
  'upower: Battery Status API support')
source=(
  "helium-browser.sh::https://files.catbox.moe/xqrvs8"
  "LICENSE.ungoogled_chromium::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/LICENSE.ungoogled_chromium")
sha256sums=(
  'efe795e5e946fc6737844d403f1cb9845ebaa21ca8c0ac7af53d13ff4fb7daf2'
  '9539b394e4179952698894bd62ef6566b6804ab0ff360dcf3a511cfaf7f78c4d')
source_amd64=("helium-${pkgver}-x86_64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/helium-${pkgver}-x86_64_linux.tar.xz")
source_arm64=("helium-${pkgver}-arm64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/helium-${pkgver}-arm64_linux.tar.xz")
sha256sums_amd64=('2046164d9e3c8a8b9f0c27735e01b2fd3670ddd1e1e399aa66e3d6d23dc3a186')
sha256sums_arm64=('ffb4b5efae7dde3962d2b484c61013c0dc7765c564af0b90959d1d53bb4c3e35')
_archdir="helium-${pkgver}-$([[ ${CARCH} == "arm64" ]] && echo "arm64" || echo "x86_64")_linux"

prepare() {
  sed -i \
    -e 's/Exec=chromium/Exec=helium-browser/' \
    -e 's/Name=Helium$/Name=Helium Browser/' \
    -e 's/Icon=helium/Icon=helium-browser/' \
    "${srcdir}/${_archdir}/helium.desktop"
}

package() {
  install -dm755 "${pkgdir}/usr/lib/${gives}"
  cp -a "${srcdir}/${_archdir}/"* "${pkgdir}/usr/lib/${gives}/"
  install -Dm644 "${srcdir}/${_archdir}/helium.desktop" \
    "${pkgdir}/usr/share/applications/helium-browser.desktop"
  install -Dm644 "${pkgdir}/usr/lib/${gives}/product_logo_256.png" \
    "${pkgdir}/usr/share/pixmaps/helium-browser.png"
  install -Dm644 "${pkgdir}/usr/lib/${gives}/product_logo_256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/helium-browser.png"
  install -Dm644 "${srcdir}/LICENSE.ungoogled_chromium" \
    "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.ungoogled_chromium"
  # Install the wrapper script
  install -Dm755 "${srcdir}/helium-browser.sh" "${pkgdir}/usr/bin/helium-browser"
  chmod 755 "${pkgdir}/usr/bin/helium-browser"
}
