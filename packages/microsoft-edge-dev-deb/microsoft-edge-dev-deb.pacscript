pkgname="microsoft-edge-dev-deb"
gives="microsoft-edge-dev"
replaces=("${gives}")
repology=("project: ${gives}")
pkgver="137.0.3282.1-1"
source=("https://packages.microsoft.com/repos/edge/pool/main/m/${gives}/${gives}_${pkgver}_amd64.deb")
pkgdesc="The Chromium-based web browser from Microsoft - Developer channel"
sha256sums=("4f8b50a5baaf5e08767357ab834aca985bd22e02108ae9084c4d129a8d1789b3")
arch=('amd64')
maintainer=(
  "Oren Klopfer <oren@taumoda.com>"
  "James Ed Randson <jimedrand@disroot.org>"
)
