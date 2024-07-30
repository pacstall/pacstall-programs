pkgname="goverlay"
pkgver="1.2.0"
_pkgver="1.2"
pkgrel="1"
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
gives="goverlay"
replace=("goverlay-bin")
arch=("amd64")
url="https://github.com/benjamimgois/goverlay/"
source=("goverlay-${pkgver}::https://github.com/benjamimgois/goverlay/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums="ce18c2a0810f6dc5f4e27f35d5f8d8353ef3bc78e36de57eaeb50a0821691c24"
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
  cd "goverlay-${_pkgver}"
  if [[ "sid trixie noble oracular devel" =~ ${DISTRO#*:} ]]; then
    make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus/default
  else
    make -j "${NCPU}" LAZBUILDOPTS=--lazarusdir=/usr/share/lazarus/3.4.0/
  fi
}

package() {
  cd "goverlay-${_pkgver}"
  make prefix=/usr libexecdir=/lib DESTDIR="${pkgdir}" install
  # shellcheck disable=SC2140
  sed -i "/^#export*/c\export QT_QPA_PLATEFORMTHEME="qt6ct" QT_STYLE_OVERRIDE="Adwaita-Dark"" "${pkgdir}"/usr/bin/goverlay
}
