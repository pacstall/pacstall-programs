name="lazygit-bin"
pkgname="lazygit"
repology=("project: ${pkgname}")
gives="${pkgname}"
version="0.35"
url="https://github.com/jesseduffield/${pkgname}/releases/download/v${version}/${pkgname}_${version}_Linux_x86_64.tar.gz"
breaks="${pkgname}-git"
replace="${pkgname}"
description="simple terminal UI for git commands"
hash="1a68ff1d559ac5e5ba5a7eb1140db0437be29ccba3759aa196f9ceb5a85cc34e"
maintainer="Romario <romariorobby@yahoo.com>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 "${gives}" -t "${STOWDIR}/${name}/usr/bin"
}
