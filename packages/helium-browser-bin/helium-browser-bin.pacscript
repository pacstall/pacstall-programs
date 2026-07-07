_pkgname="helium"
pkgname="helium-browser-bin"
gives="helium-browser"
pkgver="0.14.3.1"
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
  "helium-browser::https://files.catbox.moe/xqrvs8"
  "${_pkgname}-${pkgver}-x86_64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64_linux.tar.xz"
  "LICENSE.ungoogled_chromium::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/LICENSE.ungoogled_chromium")
source_arm64=(
  "helium-browser::https://files.catbox.moe/xqrvs8"
  "${_pkgname}-${pkgver}-arm64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64_linux.tar.xz"
  "LICENSE.ungoogled_chromium::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/LICENSE.ungoogled_chromium")
sha256sums_amd64=(
  '98404a938f96f4c8b2bbb92bed0422fd60c7e1591ec6bd69c4dc5e8b67212793'
  'efe795e5e946fc6737844d403f1cb9845ebaa21ca8c0ac7af53d13ff4fb7daf2'
  '9539b394e4179952698894bd62ef6566b6804ab0ff360dcf3a511cfaf7f78c4d'
)
sha256sums_arm64=(
  '9539b394e4179952698894bd62ef6566b6804ab0ff360dcf3a511cfaf7f78c4d'
  '8fa248704be9ec4475a306ffed407ad777d600b24021c005f7dd9b2e707e3448'
  'efe795e5e946fc6737844d403f1cb9845ebaa21ca8c0ac7af53d13ff4fb7daf2
)

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
