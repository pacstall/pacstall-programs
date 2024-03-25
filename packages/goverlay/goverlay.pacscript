# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
name="goverlay"
gives="goverlay"
pkgver="1.1.1"
url="https://github.com/benjamimgois/goverlay/archive/refs/tags/${pkgver}.tar.gz"
hash="06dcad9ab7db990f2df04be01d549953e274907d7f691fe1bc4bbe712329936c"
depends=("mangohud" "libqt5pas-dev")
pkgdesc="Graphical UI to help manage Linux overlays"
maintainer="Xdavius <xdavius@github.com>"
repology=("project: goverlay")
pkgname=goverlay
pkgver=1.1.1
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch="amd64"
homepage="https://github.com/benjamimgois/goverlay"
license=('GPL-3.0-or-later')
depends=('qt6pas' 'mangohud')
makedepends=('git' 'lazarus-ide' 'libglu1-mesa-dev' 'qt6-base-dev')
pacdeps=('qt6pas')
checkdepends=('appstream' 'desktop-file-utils')

build() {
	make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus/default
}

check() {
	make tests
}

package() {
	sudo make prefix=/usr libexecdir=/lib DESTDIR="${pkgdir}" install
}
