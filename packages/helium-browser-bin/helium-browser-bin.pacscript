_pkgname="helium"
pkgname="helium-browser-bin"
gives="helium-browser"
pkgver="0.7.7.1"
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
source_amd64=(
  "${_pkgname}-${pkgver}-x86_64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64_linux.tar.xz"
  "LICENSE.ungoogled_chromium::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/LICENSE.ungoogled_chromium")
source_arm64=(
  "${_pkgname}-${pkgver}-arm64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64_linux.tar.xz"
  "LICENSE.ungoogled_chromium::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/LICENSE.ungoogled_chromium")
sha256sums_amd64=('698f46c080cf4dcb249b9e4d96e4b2c640870ba76b77a05d05a358661af39511'
  '9539b394e4179952698894bd62ef6566b6804ab0ff360dcf3a511cfaf7f78c4d')
sha256sums_arm64=('efa849d7dfdb1f3744d7ffe478617d8a66243073b2e951e9039e9bc44920c200'
  '9539b394e4179952698894bd62ef6566b6804ab0ff360dcf3a511cfaf7f78c4d')

prepare() {
  _archdir="${_pkgname}-${pkgver}-$([[ ${CARCH} == "arm64" ]] && echo "arm64" || echo "x86_64")_linux"
  sed -i \
    -e 's/Exec=chromium/Exec=helium-browser/' \
    -e 's/Name=Helium$/Name=Helium Browser/' \
    -e 's/Icon=helium/Icon=helium-browser/' \
    "${srcdir}/${_archdir}/helium.desktop"
}

package() {
  _archdir="${_pkgname}-${pkgver}-$([[ ${CARCH} == "arm64" ]] && echo "arm64" || echo "x86_64")_linux"
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
  install -Dm755 "${srcdir}/helium-browser" "${pkgdir}/usr/bin/helium-browser"
  chmod 755 "${pkgdir}/usr/bin/helium-browser"
}
