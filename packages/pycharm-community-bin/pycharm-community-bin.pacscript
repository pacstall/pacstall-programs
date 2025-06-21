pkgname="pycharm-community-bin"
pkgver="2025.1.2"
gives="pycharm-community"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>" "ObsidianPresidium <emil@aarestrup.nu>")
pkgdesc="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
source_amd64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz")
sha256sums_amd64=("193fbbb638235c4c671bb6c6b432f43a2d46f7f7ebd6b5f2cc8a1db7db93c5d6")
source_arm64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("10e7426804d649d3c5bdbfc365cf85fe73dd7e74e67fd1e4c82645e8532d17e7")
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
