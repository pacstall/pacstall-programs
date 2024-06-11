pkgname="ferium-bin"
gives="ferium"
breaks=("${gives}")
replaces=("${gives}-git")
repology=("project: ${gives}")
pkgver="4.6.0"
source=("https://github.com/gorilla-devs/${gives}/releases/download/v${pkgver}/${gives}-linux-nogui.zip")
sha256sums=("2fa5be7603a0d7da752263f3dc4a0c0e768cb54bb509f2febf251461740a6aab")
pkgdesc="Fast and multi-source CLI program for managing Minecraft mods"
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${_archive}"
  install -Dm755 ferium "${pkgdir}/usr/bin/${gives}"
  # install shell completions
  "${pkgdir}/usr/bin/${gives}" complete bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ferium"
  "${pkgdir}/usr/bin/${gives}" complete fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ferium.fish"
  "${pkgdir}/usr/bin/${gives}" complete zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ferium"
}

# vim:set ft=sh ts=2 sw=2 et:
