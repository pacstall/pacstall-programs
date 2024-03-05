name="ferium-bin"
pkgname="ferium"
breaks=("${pkgname}")
replaces=("${pkgname}-git")
repology=("project: ${pkgname}")
pkgver="4.4.1"
source=("https://github.com/gorilla-devs/${pkgname}/releases/download/v${pkgver}/${pkgname}-linux-nogui.zip")
hash=("efb1a82381a429e4240f2872ac6b4394389b1a75f407f7e0659ab5d3f7d7319c")
pkgdesc="Fast and multi-source CLI program for managing Minecraft mods"
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -Dm755 ferium "${pkgdir}/usr/bin/${pkgname}"
  # install shell completions
  "${pkgdir}/usr/bin/${pkgname}" complete bash | sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ferium"
  "${pkgdir}/usr/bin/${pkgname}" complete fish | sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ferium.fish"
  "${pkgdir}/usr/bin/${pkgname}" complete zsh | sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ferium"
}

# vim:set ft=sh ts=2 sw=2 et:
