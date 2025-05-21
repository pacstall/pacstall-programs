pkgname="ferium-bin"
gives="ferium"
breaks=("${gives}")
replaces=("${gives}-git")
repology=("project: ${gives}")
arch=("amd64")
pkgver="4.7.1"
source=("https://github.com/gorilla-devs/${gives}/releases/download/v${pkgver}/${gives}-linux-nogui.zip")
sha256sums=("8d4a357c6eaf05bc7804d1916fe597b58f10d57fe16443b9b767776e99049d14")
pkgdesc="Fast and multi-source CLI program for managing Minecraft mods"
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  install -Dm755 ferium "${pkgdir}/usr/bin/${gives}"
  # install shell completions
  "${pkgdir}/usr/bin/${gives}" complete bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ferium"
  "${pkgdir}/usr/bin/${gives}" complete fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ferium.fish"
  "${pkgdir}/usr/bin/${gives}" complete zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ferium"
}

# vim:set ft=sh ts=2 sw=2 et:
