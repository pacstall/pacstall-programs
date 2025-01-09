pkgname='coreutils-single'
_pkgname='coreutils'
arch=("any")
pkgver='9.4'
pkgdesc='GNU Core Utilities (multicall binary)'
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52')
makedepends=(
  'bison'
  'gettext'
  'gperf'
  'groff'
  'libacl1-dev'
  'libattr1-dev'
  'libgmp3-dev'
  'libselinux1-dev'
  'libssl-dev'
  'texinfo'
)
maintainer=()
repology=("project: ${_pkgname}")

build() {
  cd "${_pkgname}-${pkgver}"
  FORCE_UNSAFE_CONFIGURE=1 ./configure --enable-single-binary --prefix=/usr
  make -j"${NCPU}"
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 "src/${_pkgname}" -t "${pkgdir}/usr/bin"
}
