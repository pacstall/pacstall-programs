name="papirus-icon-theme"
version="20220808"
description="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
url="https://github.com/PapirusDevelopmentTeam/${name}/archive/${version}/${name}-${version}.tar.gz"
hash="79885ffa464734a49ee73e60eaf78a0cf9c7d2cf310664a8b7c5c90c403644b1"
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
