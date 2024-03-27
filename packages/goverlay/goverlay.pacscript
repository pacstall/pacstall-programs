maintainer="Xdavius <xdavius@github.com>"
name="goverlay"
gives="goverlay"
pkgver="1.1.1"
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=("amd64")
depends=('libqt6pas6' 'mangohud')
makedepends=('git' 'lazarus-ide' 'libglu1-mesa-dev' 'qt6-base-dev')
pacdeps=('qt6pas')
url="https://github.com/benjamimgois/goverlay/archive/refs/tags/${pkgver}.tar.gz"
hash="06dcad9ab7db990f2df04be01d549953e274907d7f691fe1bc4bbe712329936c"
repology=("project: goverlay")

build() {
	make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus/default
}

package() {
	sudo make prefix=/usr libexecdir=/lib DESTDIR="${pkgdir}" install
}
