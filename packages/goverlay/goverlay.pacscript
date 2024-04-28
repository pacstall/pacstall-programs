maintainer="Xdavius <xdavius@github.com>"
name="goverlay"
gives="goverlay"
replace=("goverlay-bin")
pkgver="1.1.1"
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=("amd64")
makedepends=('git' 'libglu1-mesa-dev' 'qt6-base-dev')
case "${DISTRO}" in
debian:testing | debian:sid)
  pacdeps=('qt6pas' 'mangohud')
  makedepends+=("lazarus" "fpc" "fpc-source")
  ;;
*)
  pacdeps=('mangohud' 'fpc-laz-deb' 'fpc-src-deb' 'lazarus-project-deb' 'qt6pas')
  ;;
esac
url="https://github.com/benjamimgois/goverlay/archive/refs/tags/${pkgver}.tar.gz"
hash="06dcad9ab7db990f2df04be01d549953e274907d7f691fe1bc4bbe712329936c"
repology=("project: goverlay")

build() {
  case "${DISTRO}" in
  debian:testing | debian:sid)
    make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus/default
    ;;
  *)
    make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/share/lazarus/3.2.0/
    ;;
  esac
}

package() {
  sudo make prefix=/usr libexecdir=/lib DESTDIR="${pkgdir}" install
  # Fix Issue to change Depends with usage of pacdeps
  sudo sed -i "/^Depends:*/c\Depends: mangohud, libqt6pas-dev" "${pkgdir}"/DEBIAN/control
}
