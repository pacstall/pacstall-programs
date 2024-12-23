pkgname="arduino-cli-bin"
gives="arduino-cli"
repology=("project: ${gives}")
arch=("amd64")
pkgver="0.35.3"
maintainer=("DismissedGuy <me@mikealmel.ooo>")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
source=("@${pkgname}~${pkgver}::https://github.com/arduino/arduino-cli/releases/download/v${pkgver}/${gives}_${pkgver}_Linux_64bit.tar.gz")
pkgdesc="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
sha256sums=("acf3a3e03f0478a1cade44d23d4bc2f979c9b61b64e13bc66e26220b7b9fbd23")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
