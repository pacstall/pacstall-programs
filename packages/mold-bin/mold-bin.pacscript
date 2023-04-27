#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="mold-bin"
gives="mold"
version="1.11.0"
arch=("amd64")
url="https://github.com/rui314/mold/releases/download/v${version}/mold-${version}-x86_64-linux.tar.gz"
description="A modern linker"
breaks=("${name}-git" "$name")
hash="bf788940db4a9ac19e7745c821bf6ee18ff4d75441a803d84f86c9f3b0aa2a5e"
repology=("project: mold")

install() {
	sudo mkdir -p "${pkgdir}/usr/"
	sudo mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:
