pkgname='coreutils-single'
_pkgname='coreutils'
arch=("any")
pkgver='9.7'
pkgdesc='GNU Core Utilities (multicall binary)'
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('e8bb26ad0293f9b5a1fc43fb42ba970e312c66ce92c1b0b16713d7500db251bf')
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
