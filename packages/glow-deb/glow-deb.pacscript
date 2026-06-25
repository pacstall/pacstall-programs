pkgname="glow-deb"
gives="glow"
replaces=("${gives}")
pkgver="2.1.2"
arch=("amd64" "arm64")
source_amd64=("https://github.com/charmbracelet/glow/releases/download/v${pkgver}/glow_${pkgver}_amd64.deb")
sha256sums_amd64=("284fff5ff69c13433cdbd5e48c85d1cf0d8abd544904b26949f3eea7ea260d44")
source_arm64=("https://github.com/charmbracelet/glow/releases/download/v${pkgver}/glow_${pkgver}_arm64.deb")
sha256sums_arm64=("0a857e05f2f245b7b95f9c205a3d1e173636df9fa03a029c749529a3f7834344")

pkgdesc="Render markdown on the CLI, with pizzazz!"
repology=("project: glow")
# vim:set ft=sh ts=2 sw=2 et:
