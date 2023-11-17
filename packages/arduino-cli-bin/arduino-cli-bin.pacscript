name="arduino-cli-bin"
pkgname="arduino-cli"
repology=("project: ${pkgname}")
pkgver="0.34.2"
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
url="https://github.com/arduino/arduino-cli/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux_64bit.tar.gz"
pkgdesc="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
hash="0ac47168800930a94ac5068ef36766eb821c1a70d63ad27bb53d061be7867bbd"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
