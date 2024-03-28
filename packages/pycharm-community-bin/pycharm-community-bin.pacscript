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
  "SKIP"
)
desktop_file_sum="0367fc67c51d5d99fd64a5184b8acb2dbed4a56bb26eecdcf25a2414f2233c04"
repology=("project: pycharm")

prepare() {
  cd "${_archive}"
  if [[ "$(sha256sum ${srcdir}/pycharm.desktop | cut -d' ' -f 1)" != "${desktop_file_sum}" ]]; then
    fancy_message error "Checksum for ${srcdir}/pycharm.desktop failed"
    return 1
  fi
}

package() {
  cd "${_archive}"
  sudo mkdir -p "${pkgdir}/usr/share/licenses/pycharm"
  sudo mkdir -p "${pkgdir}/usr/share/pycharm"
  sudo mkdir -p "${pkgdir}/usr/share/pixmaps"
  sudo cp -dr --no-preserve='ownership' bin jbr lib plugins "${pkgdir}/usr/share/pycharm/"
  sudo cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/pycharm/"
  sudo cp -dr "${pkgdir}/usr/share/pycharm/bin/pycharm.png" "${pkgdir}/usr/share/pixmaps/"
  sudo install -Dm 644 ${srcdir}/pycharm.desktop -t "${pkgdir}"/usr/share/applications/
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo ln -s "/usr/share/pycharm/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm"
}
