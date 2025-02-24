pkgname="pycharm-community-bin"
pkgver="2024.3.3"
gives="pycharm-community"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>" "ObsidianPresidium <emil@aarestrup.nu>")
pkgdesc="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
source_amd64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz")
sha256sums_amd64=("fbcbb8c5a23f5eabb1ab4b8e66ffb3b00988eab39df0b547c41ffbb1fc13968e")
source_arm64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("8a2c6064ac71769164f896ab4a6a72fffcadd6350875d43dbcf45ff853b6e5ce")
repology=("project: pycharm")

package() {
  cd "${srcdir}/pycharm-community-${pkgver}"
  install -dm755 "${pkgdir}/usr/share/licenses/pycharm"
  install -dm755 "${pkgdir}/usr/share/pycharm"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  cp -dr --no-preserve='ownership' bin jbr lib modules plugins product-info.json "${pkgdir}/usr/share/pycharm/"
  cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/pycharm/"
  cp -dr "bin/pycharm.png" "${pkgdir}/usr/share/pixmaps/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/usr/share/pycharm/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm"
  install -dm755 "${pkgdir}/usr/share/applications/"
  cat << EOF > "${pkgdir}/usr/share/applications/pycharm.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm
Icon=pycharm
Exec=/usr/share/pycharm/bin/pycharm
Comment=Python IDE for professional developers aimed at productivity with a keyboard-centric focus.
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm
EOF
}
