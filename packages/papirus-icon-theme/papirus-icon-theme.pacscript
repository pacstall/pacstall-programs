name="papirus-icon-theme"
version="20220508"
description="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
url="https://github.com/PapirusDevelopmentTeam/${name}/archive/${version}/${name}-${version}.tar.gz"
hash="0b17c824de8498dae0e2a0e27d24bf79f42eae4041003b509decb2c1ec69d8db"
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
