name="papirus-folders"
version="1.12.1"
description="Papirus folder theme"
repology=("project: papirus-folders")
depends=("papirus-icon-theme")
url="https://github.com/PapirusDevelopmentTeam/${gives}/archive/refs/tags/v${version}.tar.gz"
hash="e0079af92ffc1b16eebd0f182d740e85aa2e34450cf0f191c229a568fcc5bee0"
maintainer="Oren Klopfer <oren@taumoda.com>"

install() {
  sudo make DESTDIR="${pkgdir}" install
}
