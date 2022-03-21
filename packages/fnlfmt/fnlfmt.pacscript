#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fnlfmt"
pkgdir="${STOWDIR}/${name}"
version="0.2.2"
description="A more intuitive version of du in rust"
url="https://git.sr.ht/~technomancy/fnlfmt/archive/${version}.tar.gz"
gives="${pkgname}"
breaks="${pkgname}-bin ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
depends="lua5.3"
hash="9e14d6750495c78daa7a474ff2d44bccee260e3d39e55dd61d86986e75bd9def"
repology=("project: fnlfmt")

prepare() {
  true
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo install -D "${name}" "${pkgdir}/usr/bin/${name}"
}

# vim:set ft=sh ts=2 sw=2 et:
