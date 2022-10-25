name="ferium-bin"
pkgname="ferium"
breaks="${pkgname}"
replace="${pkgname}-git"
repology=("project: ${pkgname}")
version="4.2.0"
url="https://github.com/gorilla-devs/${pkgname}/releases/download/v${version}/${pkgname}-linux-nogui.zip"
hash="151d76a917c012aee9b8e8fa47170974903f6868bdb500598167fe082692dd73"
description="Fast and multi-source CLI program for managing Minecraft mods"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

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
