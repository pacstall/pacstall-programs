pkgname="microsoft-edge-dev-deb"
gives="microsoft-edge-dev"
replaces=("${gives}")
repology=("project: ${gives}")
pkgver="130.0.2835.2-1"
source=("https://packages.microsoft.com/repos/edge/pool/main/m/${gives}/${gives}_${pkgver}_amd64.deb")
pkgdesc="The Chromium-based web browser from Microsoft - Developer channel"
sha256sums=("b33c4c9eac3bb54bc04acc6c61a72b4374ada1f5091c158722117711f188540b")
arch=('amd64')
maintainer=(
  "Oren Klopfer <oren@taumoda.com>"
  "James Ed Randson <jimedrand@disroot.org>"
)
