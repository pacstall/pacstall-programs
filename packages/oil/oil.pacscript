#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="oil"
pkgdir="${STOWDIR}/${name}"
version="0.10.1"
description="A bash-compatible UNIX shell written in Python"
url="https://www.oilshell.org/download/oil-${version}.tar.xz"
gives="oil"
breaks="${name}-bin ${name}-git ${name}-deb ${name}-app"
hash="8c8f9043e8c4dd0cddd1bf558ac855c01cc39451c254abfc719d01b079e47744"
repology=("project: oil-shell")

# Edit MAKEFLAGS here
MAKEFLAGS=

prepare() {
  mkdir -p tmp
}

build() {
  TMPDIR="./tmp/" ./configure --prefix="/usr"

  # We want this to expand
  # shellcheck disable=SC2248
  make -j"$(nproc)" ${MAKEFLAGS}
}

install() {
  sudo DESTDIR="${pkgdir}" ./install
}
# vim:set ft=sh ts=2 sw=2 et:
