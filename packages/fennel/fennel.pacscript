#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fennel"
version="1.3.0"
description="A Lua Lisp language"
depends=("lua5.3")
url="https://fennel-lang.org/downloads/fennel-${version}"
breaks=("${name}-bin" "${name}-git" "${name}-deb" "${name}-app")
hash="858483deb05817c8938c1380d66f93bd4bbc052a7cabab883145e2d31c28fdd5"
repology=("project: fennel")

install() {
  # Install binary
  sudo install -Dm755 "fennel-${version}" "${pkgdir}/usr/bin/${name}"
}
# vim:set ft=sh ts=2 sw=2 et:
