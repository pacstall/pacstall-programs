#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="oil"
pkgdir="${STOWDIR}/${name}"
version="0.13.0"
description="A bash-compatible UNIX shell written in Python"
url="https://www.oilshell.org/download/oil-${version}.tar.xz"
gives="oil"
breaks="${name}-bin ${name}-git ${name}-deb ${name}-app"
hash="4556b3f74d184aae6c551ae25a4dacb989c060f5c8ce54fe4da441a7f2a768e3"
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
