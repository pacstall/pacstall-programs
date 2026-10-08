pkgname='coreutils-single'
_pkgname='coreutils'
arch=("any")
pkgver='9.11'
pkgdesc='GNU Core Utilities (multicall binary)'
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('394024eda0a5955217ceda9cd1201e65dc8fa3aa29c2951135a49521d57c3cc3')
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
replaces=("rust-coreutils")
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
