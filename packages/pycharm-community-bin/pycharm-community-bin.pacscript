pkgname="pycharm-community-bin"
pkgver="2026.2.1"
gives="pycharm-community"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>" "ObsidianPresidium <emil@aarestrup.nu>")
pkgdesc="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
source_amd64=("https://github.com/JetBrains/intellij-community/releases/download/pycharm/${pkgver}/pycharm-${pkgver}.tar.gz")
sha256sums_amd64=("6d51f228c9a6c8927447c4498c40cb24dca6b5fe75436e7402328eefd27d5f01")
source_arm64=("https://github.com/JetBrains/intellij-community/releases/download/pycharm/${pkgver}/pycharm-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("63201898bcf2f621a22aecbaa36155a4659eaad7873148e6b2a05d51bb78d41e")
repology=("project: pycharm")

package() {
  cd "${srcdir}/pycharm-oss"
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
