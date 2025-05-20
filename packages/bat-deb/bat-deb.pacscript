pkgname="bat-deb"
gives="bat"
replaces=("${gives}")
pkgver="0.25.0"
source=("https://github.com/sharkdp/${gives}/releases/download/v${pkgver}/bat_${pkgver}_amd64.deb")
pkgdesc="A cat(1) clone with wings"
sha256sums=("7e6afdffaea04b394f466f6f719a1e0565572a4b59d6cb9969843355b684e2dc")
maintainer=("Elsie19 <elsie19@pm.me>")
arch=('amd64')
repology=("project: bat-cat")

# vim:set ft=sh ts=2 sw=2 et:
