pkgname="bat-deb"
gives="bat"
replaces=("${gives}")
pkgver="0.26.1"
source=("https://github.com/sharkdp/${gives}/releases/download/v${pkgver}/bat_${pkgver}_amd64.deb")
pkgdesc="A cat(1) clone with wings"
sha256sums=("ad59954aa1540e526f97267f60557ea5ef4c7dcf91a0811254134537cb353a3c")
maintainer=("Elsie19 <elsie19@pm.me>")
arch=('amd64')
repology=("project: bat-cat")

# vim:set ft=sh ts=2 sw=2 et:
