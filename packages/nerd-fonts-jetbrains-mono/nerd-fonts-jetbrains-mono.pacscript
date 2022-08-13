name="nerd-fonts-jetbrains-mono"
pkgname="nerd-fonts-jetbrains-mono"
breaks="${pkgname}"
gives="${pkgname}"
repology=("project: nerd-fonts")
version="2.1.0"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/JetBrainsMono.zip"
description="Patched font JetBrains Mono fron nerd-fonts library"
hash="842013fa44b6896d4eb91635a81ef75244d78d7f61ff866c9dfd3315a67788cd"
maintainer="Damian Bednarczyk <dbednar230@gmail.com>"

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

