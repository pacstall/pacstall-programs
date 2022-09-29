name="nerd-fonts-hack"
pkgname="nerd-fonts-hack"
breaks="${pkgname}"
gives="${pkgname}"
#repology=("project: fonts:nerd-fonts")
version="2.2.2"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/Hack.zip"
description="Patched font Hack from nerd-fonts library"
hash="1f031b6d08d51f4830eacd00853dddc7fbd4ae0a05e169f2c13f3037dd3359b3"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo install -d "${STOWDIR}/${name}"/usr/share/fonts/TTF
    sudo rm "${SRCDIR:?}/"*"Windows Compatible.ttf"
    sudo install -Dm644 "${SRCDIR}/"*.ttf "${STOWDIR}/${name}"/usr/share/fonts/TTF
}
