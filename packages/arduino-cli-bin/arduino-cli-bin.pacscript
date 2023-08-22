name="arduino-cli-bin"
pkgname="arduino-cli"
repology=("project: ${pkgname}")
pkgver="0.34.0"
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
url="https://github.com/arduino/arduino-cli/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux_64bit.tar.gz"
pkgdesc="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
hash="9ba053c84b8960f2cc254fc97b66fb6693a287b87fff7f1d11c968bf3f12f333"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
