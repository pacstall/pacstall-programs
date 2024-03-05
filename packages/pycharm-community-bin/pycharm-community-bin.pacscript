name="pycharm-community-bin"
pkgver="2023.2.5"
pkgname="pycharm-community"
gives="pycharm-community"
maintainer="ObsidianPresidium <emil@aarestrup.nu>"
pkgdesc="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
source=(
  "https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/pycharm.desktop"
)
hash=(
  "3a35e0b2245e6ecad5dc05b0fc81cf36cb4f5fe0bc987c8559e04c808de9d072"
  "0367fc67c51d5d99fd64a5184b8acb2dbed4a56bb26eecdcf25a2414f2233c04"
)
repology=("project: pycharm")

package() {
  sudo mkdir -p "${pkgdir}/usr/share/licenses/pycharm"
  sudo mkdir -p "${pkgdir}/usr/share/pycharm"
  sudo mkdir -p "${pkgdir}/usr/share/pixmaps"
  sudo cp -dr --no-preserve='ownership' bin jbr lib plugins "${pkgdir}/usr/share/pycharm/"
  sudo cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/pycharm/"
  sudo cp -dr "${pkgdir}/usr/share/pycharm/bin/pycharm.png" "${pkgdir}/usr/share/pixmaps/"
  sudo install -Dm 644 pycharm.desktop -t "${pkgdir}"/usr/share/applications/
}

post_install() {
  sudo ln -sf "/usr/share/pycharm/bin/pycharm.sh" "/usr/bin/pycharm"
}

post_remove() {
  sudo rm -f /usr/bin/pycharm
}
