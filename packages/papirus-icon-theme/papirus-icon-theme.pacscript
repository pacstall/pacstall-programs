name="papirus-icon-theme"
version="20220302"
description="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
url="https://github.com/PapirusDevelopmentTeam/$name/archive/$version/$name-$version.tar.gz"
hash="73230479b6faee3013b3cc6e689b92dca4d3ed0df40a23f899827532573083ce"
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
    cd "${SRCDIR}/${name}-${version}"
    sudo make DESTDIR="${STOWDIR}/${name}" install
}
