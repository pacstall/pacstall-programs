pkgname="goverlay"
pkgver="1.1.1"
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
gives="goverlay"
replace=("goverlay-bin")
arch=("amd64")
url="https://github.com/benjamimgois/goverlay/"
source=("https://github.com/benjamimgois/goverlay/archive/refs/tags/${pkgver}.tar.gz")
sha256sums="06dcad9ab7db990f2df04be01d549953e274907d7f691fe1bc4bbe712329936c"
makedepends=('git' 'libglu1-mesa-dev' 'qt6-base-dev')
depends=("mangohud" "libqt6pas-dev" "qt6ct" "adwaita-qt6")
pacdeps=('qt6pas' 'mangohud')
external_connection=true
makedepends_sid=("lazarus" "fpc" "fpc-source")
makedepends_trixie=("${makedepends_sid[@]}")
makedepends_noble=("${makedepends_sid[@]}")
makedepends_oracular=("${makedepends_sid[@]}")
makedepends_devel=("${makedepends_sid[@]}")
if [[ ! "sid trixie noble oracular devel" =~ ${DISTRO#*:} ]]; then
  pacdeps+=('fpc-laz-deb' 'fpc-src-deb' 'lazarus-project-deb')
fi
maintainer=("xdavius <xdavius@github.com>")
repology=("project: goverlay")

build() {
  cd "${_archive}"
  if [[ "sid trixie noble oracular devel" =~ ${DISTRO#*:} ]]; then
    make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus/default
  else
    make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/share/lazarus/3.4.0/
  fi
}

package() {
  cd "${_archive}"
  make prefix=/usr libexecdir=/lib DESTDIR="${pkgdir}" install
  # shellcheck disable=SC2140
  sed -i "/^#export*/c\export QT_QPA_PLATEFORMTHEME="qt6ct" QT_STYLE_OVERRIDE="Adwaita-Dark"" "${pkgdir}"/usr/bin/goverlay
}
