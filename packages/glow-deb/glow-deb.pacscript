pkgname="glow-deb"
gives="glow"
replaces=("${gives}")
pkgver="2.1.1"
arch=("amd64" "arm64")
source_amd64=("https://github.com/charmbracelet/glow/releases/download/v${pkgver}/glow_${pkgver}_amd64.deb")
sha256sums_amd64=("4d34c7100b1ee6d6eb74ea2513bf076b361489b5165394ac8f21a3485f982d99")
source_arm64=("https://github.com/charmbracelet/glow/releases/download/v${pkgver}/glow_${pkgver}_arm64.deb")
sha256sums_arm64=("51abf1f0aa8b686ef29bbebb96b758b6286c11d0e5ab38b5265ae8bf5bf9494c")

pkgdesc="Render markdown on the CLI, with pizzazz!"
repology=("project: glow")
# vim:set ft=sh ts=2 sw=2 et:
