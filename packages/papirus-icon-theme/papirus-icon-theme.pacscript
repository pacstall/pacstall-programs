name="papirus-icon-theme"
version="20220606"
description="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
url="https://github.com/PapirusDevelopmentTeam/${name}/archive/${version}/${name}-${version}.tar.gz"
hash="139d18bada63d72779f2b604dbe893987d74000de728165ef1cb8baa4624b9c6"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${name}"
breaks="${name} ${name}-git"

depends="gtk-update-icon-cache"
build_depends="make"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo make DESTDIR="${STOWDIR}/${name}" install
}
