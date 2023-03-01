name="arduino-cli-bin"
pkgname="arduino-cli"
repology=("project: ${pkgname}")
version="0.30.0"
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
url="https://github.com/arduino/arduino-cli/releases/download/${version}/${pkgname}_${version}_Linux_64bit.tar.gz"
description="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
hash="f6b1cddf3459b1b6ca9dafe36315c2fa1f6f77386ab3795bbad6a117cbe4230b"

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
