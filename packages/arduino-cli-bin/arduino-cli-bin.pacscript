name="arduino-cli-bin"
pkgname="arduino-cli"
repology=("project: ${pkgname}")
pkgver="0.33.1"
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
url="https://github.com/arduino/arduino-cli/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux_64bit.tar.gz"
pkgdesc="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
hash="959a9542664608f59851fc291acf53d5335b22736122ce6eb3ed11e7c021a42b"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
