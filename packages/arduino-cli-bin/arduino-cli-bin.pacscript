name="arduino-cli-bin"
pkgname="arduino-cli"
repology=("project: ${pkgname}")
version="0.25.1"
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
url="https://github.com/arduino/arduino-cli/releases/download/${version}/${pkgname}_${version}_Linux_64bit.tar.gz"
description="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
hash="65bd6ac6fdc4e48024ff73db3c952f2276453e8858dbe3f62f826a5dee4e903f"

prepare() {
	true
}

build() {
	true
}

install() {
	sudo install -Dm755 ${pkgname} -t "${STOWDIR}/${name}/usr/bin"
}
