pkgname="pycharm-community-bin"
pkgver="2024.2.3"
gives="pycharm-community"
arch=("amd64")
maintainer=("ObsidianPresidium <emil@aarestrup.nu>" "James Ed Randson <jimedrand@disroot.org>")
pkgdesc="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
source=(
  "https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz"
  "pycharm.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/pycharm.desktop"
)
sha256sums=(
  "448f6c48a51bb419c68c763b0e4eefc0449ad7bbad534de3f93b2f1a40308833"
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
