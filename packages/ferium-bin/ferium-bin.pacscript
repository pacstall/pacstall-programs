name="ferium-bin"
pkgname="ferium"
breaks="${pkgname}"
replace="${pkgname}-git"
repology=("project: ${pkgname}")
version="4.3.4"
url="https://github.com/gorilla-devs/${pkgname}/releases/download/v${version}/${pkgname}-linux-nogui.zip"
hash="2078f96e77e759f3ac6df5d5415849c22557803eb961ba4d39fa76c3b5fdcf98"
description="Fast and multi-source CLI program for managing Minecraft mods"
maintainer="Henryws <hwengerstickel@pm.me>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 ferium "${STOWDIR}/${name}/usr/bin/${pkgname}"
  # install shell completions
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete bash | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/bash-completion/completions/ferium"
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete fish | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/fish/vendor_completions.d/ferium.fish"
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete zsh | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/zsh/site-functions/_ferium"
}

# vim:set ft=sh ts=2 sw=2 et:
