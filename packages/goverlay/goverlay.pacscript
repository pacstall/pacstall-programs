maintainer="Xdavius <xdavius@github.com>"
pkgname="goverlay"
pkgver="1.1.1"
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
gives="goverlay"
replace=("goverlay-bin")
arch=("amd64")
url="https://github.com/benjamimgois/goverlay/"
source=("https://github.com/benjamimgois/goverlay/archive/refs/tags/${pkgver}.tar.gz")
sha256sums="06dcad9ab7db990f2df04be01d549953e274907d7f691fe1bc4bbe712329936c"
repology=("project: goverlay")
makedepends=('git' 'libglu1-mesa-dev' 'qt6-base-dev')
depends=("mangohud" "libqt6pas-dev" "qt6ct" "adwaita-qt6")
external_connection=true
case "${DISTRO}" in
debian:testing | debian:sid | ubuntu:noble | ubuntu:devel | ubuntu:rolling)
  pacdeps=('qt6pas' 'mangohud')
  makedepends+=("lazarus" "fpc" "fpc-source")
  ;;
*)
  pacdeps=('mangohud' 'fpc-laz-deb' 'fpc-src-deb' 'lazarus-project-deb' 'qt6pas')
  ;;
esac

build() {
  cd "${_archive}"
  case "${DISTRO}" in
  debian:testing | debian:sid | ubuntu:noble | ubuntu:devel | ubuntu:rolling)
    make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus/default
    ;;
  *)
    make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/share/lazarus/3.2.0/
    ;;
  esac
}

package() {
  cd "${_archive}"
  make prefix=/usr libexecdir=/lib DESTDIR="${pkgdir}" install
  # shellcheck disable=SC2140
  sed -i "/^#export*/c\export QT_QPA_PLATEFORMTHEME="qt6ct" QT_STYLE_OVERRIDE="Adwaita-Dark"" "${pkgdir}"/usr/bin/goverlay

  # Fix Issue to change Depends with usage of pacdeps
  #sed -i "/^Depends:*/c\Depends: mangohud, libqt6pas-dev, qt6ct, adwaita-qt6" "${pkgdir}"/DEBIAN/control
}
