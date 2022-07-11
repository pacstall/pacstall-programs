name="papirus-icon-theme"
version="20220710"
description="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
url="https://github.com/PapirusDevelopmentTeam/${name}/archive/${version}/${name}-${version}.tar.gz"
hash="9aa81b51b73bfafeae7dbf7ef411db7c74fcff983e4b13c0e05e481dc65971b2"
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
