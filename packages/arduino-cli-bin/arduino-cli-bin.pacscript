pkgname="arduino-cli-bin"
gives="arduino-cli"
repology=("project: ${gives}")
arch=("amd64")
pkgver="1.4.1"
maintainer=("DismissedGuy <me@mikealmel.ooo>")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
source=("@${pkgname}~${pkgver}::https://github.com/arduino/arduino-cli/releases/download/v${pkgver}/${gives}_${pkgver}_Linux_64bit.tar.gz")
pkgdesc="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
sha256sums=("683cf2a6b8953e3d632e7e4512c36667839d2073349c4b6d312e4c67592359bd")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
