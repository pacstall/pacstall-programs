pkgname="microsoft-edge-stable-deb"
gives="microsoft-edge-stable"
replaces=("${gives}")
repology=("project: microsoft-edge")
pkgver="129.0.2792.52-1"
source=("https://packages.microsoft.com/repos/edge/pool/main/m/${gives}/${gives}_${pkgver}_amd64.deb")
pkgdesc="The Chromium-based web browser from Microsoft"
sha256sums=("b62aba3f00eb1fc65cb5fc83cdaf56dd63ac8fb340aefe17c8c3c6594edf5bb0")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>" "James Ed Randson <jimedrand@disroot.org>")
