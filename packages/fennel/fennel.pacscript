#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fennel"
pkgver="1.3.1"
pkgdesc="A Lua Lisp language"
depends=("lua5.3")
source=("https://fennel-lang.org/downloads/fennel-${pkgver}")
breaks=("${name}-bin" "${name}-git" "${name}-deb" "${name}-app")
hash=("40a64d31a69803213d0e56f839814d5a13ae6fc40cc435b0c3be294e2ccda1ca")
repology=("project: fennel")

package() {
  # Install binary
  sudo install -Dm755 "fennel-${pkgver}" "${pkgdir}/usr/bin/${name}"
}
# vim:set ft=sh ts=2 sw=2 et:
