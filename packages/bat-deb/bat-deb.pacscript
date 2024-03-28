pkgname="bat-deb"
gives="bat"
replaces=("${gives}")
pkgver="0.24.0"
source=("https://github.com/sharkdp/${gives}/releases/download/v${pkgver}/bat_${pkgver}_amd64.deb")
pkgdesc="A cat(1) clone with wings"
sha256sums=("fa9353fa0c6e1e67b87757c4bd6bf515f85d3fc16d41b12cc26f7a673892ad01")
maintainer=("Elsie19 <elsie19@pm.me>")
arch=('amd64')
repology=("project: bat-cat")

# vim:set ft=sh ts=2 sw=2 et:
