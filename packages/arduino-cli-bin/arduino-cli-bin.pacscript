name="arduino-cli-bin"
pkgname="arduino-cli"
repology=("project: ${pkgname}")
pkgver="0.35.3"
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
source=("https://github.com/arduino/arduino-cli/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux_64bit.tar.gz")
pkgdesc="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
hash=("acf3a3e03f0478a1cade44d23d4bc2f979c9b61b64e13bc66e26220b7b9fbd23")

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
