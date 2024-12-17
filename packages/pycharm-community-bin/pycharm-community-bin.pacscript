pkgname="pycharm-community-bin"
pkgver="2024.3"
gives="pycharm-community"
arch=("amd64" "arm64")
maintainer=("ObsidianPresidium <emil@aarestrup.nu>" "James Ed Randson <jimedrand@disroot.org>")
pkgdesc="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
external_connection="true"
source_amd64=(
  "https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz"
  "pycharm.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/pycharm.desktop"
)
sha256sums_amd64=(
  "266975b832a4b2ec6cf23adc2c244650c1fb546f1ffa36dc2405866f1c32cb3e"
  "0367fc67c51d5d99fd64a5184b8acb2dbed4a56bb26eecdcf25a2414f2233c04"
)
source_arm64=(
  "https://download.jetbrains.com/python/pycharm-community-${pkgver}-aarch64.tar.gz"
  "pycharm.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/pycharm.desktop"
)
sha256sums_arm64=(
  "1198417e8fc7a7bc789a78939ebcab238c93121e64f706b3f2e6ab31c69fd633"
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
