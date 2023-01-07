name="arduino-cli-bin"
pkgname="arduino-cli"
repology=("project: ${pkgname}")
version="0.29.0"
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
url="https://github.com/arduino/arduino-cli/releases/download/${version}/${pkgname}_${version}_Linux_64bit.tar.gz"
description="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
hash="febc558bb36a9aeb881ebcce0af6fff955234afda14435791ca41daf492c9cac"

install() {
  sudo install -Dm755 ${pkgname} -t "${pkgdir}/usr/bin"
}
