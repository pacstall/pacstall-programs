#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="oil"
arch=("any")
pkgver="0.20.0"
pkgdesc="A bash-compatible UNIX shell written in Python"
source=("@${pkgname}~${pkgver}::https://www.oilshell.org/download/oil-${pkgver}.tar.xz")
gives="oil"
breaks=("${pkgname}-bin" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
sha256sums=("42b85f52bbba4a3bb8e16f23fc394c4302bcfd9638f067f01c37d23f2ee449a0")
repology=("project: oil-shell")

# Edit MAKEFLAGS here
MAKEFLAGS=()

prepare() {
  cd "${pkgname}~${pkgver}"
  mkdir -p tmp
}

build() {
  cd "${pkgname}~${pkgver}"
  TMPDIR="./tmp/" ./configure --prefix="/usr"

  # We want this to expand
  # shellcheck disable=SC2248
  make -j"${NCPU}" "${MAKEFLAGS[@]}"
}

package() {
  cd "${pkgname}~${pkgver}"
  DESTDIR="${pkgdir}" ./install
}
# vim:set ft=sh ts=2 sw=2 et:
