#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="oil"
pkgdir="${STOWDIR}/${name}"
version="0.9.8"
description="A bash-compatible UNIX shell written in Python"
url="https://www.oilshell.org/download/oil-${version}.tar.xz"
gives="oil"
breaks="${name}-bin ${name}-git ${name}-deb ${name}-app"
hash="3acaf17c9e5d17d027a60d6be878fe683d7de25f7d5fd621e2f219f91f9a1fc1"
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
