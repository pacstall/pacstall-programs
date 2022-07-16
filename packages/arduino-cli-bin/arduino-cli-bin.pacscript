name="arduino-cli-bin"
pkgname="arduino-cli"
repology=("project: ${pkgname}")
version="0.24.0"
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
url="https://github.com/arduino/arduino-cli/releases/download/${version}/${pkgname}_${version}_Linux_64bit.tar.gz"
description="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
hash="0244e41f56b70de6a28cb5d4cb064f32857cca3ea0832ab775887b408c7e381d"

prepare() {
	true
}

build() {
	true
}

install() {
	sudo install -Dm755 ${pkgname} -t "${STOWDIR}/${name}/usr/bin"
}
