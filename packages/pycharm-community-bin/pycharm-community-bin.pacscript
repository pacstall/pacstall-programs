pkgname="pycharm-community-bin"
pkgver="2024.3.1.1"
gives="pycharm-community"
arch=("amd64" "arm64")
maintainer=("ObsidianPresidium <emil@aarestrup.nu>" "James Ed Randson <jimedrand@disroot.org>")
pkgdesc="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
source_amd64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz")
sha256sums_amd64=("36b9332262815099d0b86d2689fcf91b379730cb838623d82c0845969bb6470f")
source_arm64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("cbc36953b6943e70468e1908bef9adddc2a9597124e5d794f294095888b0914c")
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
