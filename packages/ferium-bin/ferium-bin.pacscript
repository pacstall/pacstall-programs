name="ferium-bin"
pkgname="ferium"
breaks=("${pkgname}")
replace=("${pkgname}-git")
repology=("project: ${pkgname}")
version="4.4.0"
url="https://github.com/gorilla-devs/${pkgname}/releases/download/v${version}/${pkgname}-linux-nogui.zip"
hash="e1d7e89c529581e793c887abfeddd89e68024c777f336e41f6623777cff6f05c"
description="Fast and multi-source CLI program for managing Minecraft mods"
maintainer="Elsie19 <hwengerstickel@pm.me>"

install() {
  sudo install -Dm755 ferium "${pkgdir}/usr/bin/${pkgname}"
  # install shell completions
  "${pkgdir}/usr/bin/${pkgname}" complete bash | sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ferium"
  "${pkgdir}/usr/bin/${pkgname}" complete fish | sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ferium.fish"
  "${pkgdir}/usr/bin/${pkgname}" complete zsh | sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ferium"
}

# vim:set ft=sh ts=2 sw=2 et:
