pkgname="pycharm-community-bin"
pkgver="2023.2.5"
gives="pycharm-community"
maintainer=("ObsidianPresidium <emil@aarestrup.nu>")
pkgdesc="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
source=(
  "https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz"
  "pycharm.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/pycharm.desktop"
)
sha256sums=(
  "3a35e0b2245e6ecad5dc05b0fc81cf36cb4f5fe0bc987c8559e04c808de9d072"
  "0367fc67c51d5d99fd64a5184b8acb2dbed4a56bb26eecdcf25a2414f2233c04"
)
repology=("project: pycharm")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/share/licenses/pycharm"
  mkdir -p "${pkgdir}/usr/share/pycharm"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp -dr --no-preserve='ownership' bin jbr lib plugins "${pkgdir}/usr/share/pycharm/"
  cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/pycharm/"
  cp -dr "${pkgdir}/usr/share/pycharm/bin/pycharm.png" "${pkgdir}/usr/share/pixmaps/"
  install -Dm 644 "${srcdir}"/pycharm.desktop -t "${pkgdir}"/usr/share/applications/
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/share/pycharm/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm"
}
