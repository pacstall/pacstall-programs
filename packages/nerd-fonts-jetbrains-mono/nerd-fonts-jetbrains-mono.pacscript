name="nerd-fonts-jetbrains-mono"
pkgname="nerd-fonts-jetbrains-mono"
breaks="${pkgname}"
gives="${pkgname}"
#repology=("project: fonts:nerd-fonts")
version="2.2.2"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/JetBrainsMono.zip"
description="Patched font JetBrains Mono fron nerd-fonts library"
hash="8b9b6c58081d179ecd50839a6b211dbd24b61e66d87715860129b6138982ee7b"
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
