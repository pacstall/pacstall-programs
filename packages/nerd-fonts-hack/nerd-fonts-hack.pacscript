name="nerd-fonts-hack"
pkgname="nerd-fonts-hack"
breaks="${pkgname}"
gives="${pkgname}"
repology=("project: nerd-fonts")
version="2.1.0"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/Hack.zip"
description="Patched font Hack from nerd-fonts library"
hash="70852e59fcffbe31d401f615625bcb9ebb6af72732c2f1fe9b9d5370c2565514"
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
