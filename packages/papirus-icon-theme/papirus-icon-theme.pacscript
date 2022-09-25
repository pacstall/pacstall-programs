name="papirus-icon-theme"
version="20220910"
description="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
url="https://github.com/PapirusDevelopmentTeam/${name}/archive/${version}/${name}-${version}.tar.gz"
hash="e236c96bc53105770029718158353adb79e76b18f2847ac1bb5dc5e87b09e22e"
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
