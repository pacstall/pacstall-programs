#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="oil"
pkgver="0.16.0"
pkgdesc="A bash-compatible UNIX shell written in Python"
url="https://www.oilshell.org/download/oil-${pkgver}.tar.xz"
gives="oil"
breaks=("${name}-bin" "${name}-git" "${name}-deb" "${name}-app")
hash="7111c8a8571d1a6d1d620131bc67f377dd8fe6224edbeff249e1d5d68f1dd566"
repology=("project: oil-shell")

# Edit MAKEFLAGS here
MAKEFLAGS=()

prepare() {
  mkdir -p tmp
}

build() {
  TMPDIR="./tmp/" ./configure --prefix="/usr"

  # We want this to expand
  # shellcheck disable=SC2248
  make -j"${NCPU}" "${MAKEFLAGS[@]}"
}

package() {
  sudo DESTDIR="${pkgdir}" ./install
}
# vim:set ft=sh ts=2 sw=2 et:
