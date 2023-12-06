name="ferium-bin"
gives="ferium"
breaks=("${gives}")
replace=("${gives}-git")
repology=("project: ${gives}")
pkgver="4.4.1"
url="https://github.com/gorilla-devs/${gives}/releases/download/v${pkgver}/${gives}-linux-nogui.zip"
hash="efb1a82381a429e4240f2872ac6b4394389b1a75f407f7e0659ab5d3f7d7319c"
pkgdesc="Fast and multi-source CLI program for managing Minecraft mods"
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -Dm755 ferium "${pkgdir}/usr/bin/${gives}"
  # install shell completions
  "${pkgdir}/usr/bin/${gives}" complete bash | sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ferium"
  "${pkgdir}/usr/bin/${gives}" complete fish | sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ferium.fish"
  "${pkgdir}/usr/bin/${gives}" complete zsh | sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ferium"
}

# vim:set ft=sh ts=2 sw=2 et:
