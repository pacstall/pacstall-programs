#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="oil"
pkgver="0.17.0"
pkgdesc="A bash-compatible UNIX shell written in Python"
url="https://www.oilshell.org/download/oil-${pkgver}.tar.xz"
gives="oil"
breaks=("${name}-bin" "${name}-git" "${name}-deb" "${name}-app")
hash="1fba16237fbaeb432131d0d34cf5f5d7f61a96722dce1c5f741aedc0a47cc6b3"
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
