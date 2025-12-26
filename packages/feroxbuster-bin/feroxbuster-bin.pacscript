maintainer=("0x262D <pacstall@copypaste.anonaddy.me>")
pkgname="feroxbuster-bin"
gives="feroxbuster"
depends=("fonts-noto-color-emoji")
pkgver="2.11.0"
pkgdesc="A fast, simple, recursive content discovery tool written in Rust"
source=(
  "https://github.com/epi052/${gives}/releases/download/v${pkgver}/x86_64-linux-${gives}.tar.gz"
  "${gives}.bash::https://raw.githubusercontent.com/epi052/${gives}/v${pkgver}/shell_completions/${gives}.bash"
  "_${gives}::https://raw.githubusercontent.com/epi052/${gives}/v${pkgver}/shell_completions/_${gives}"
  "${gives}.fish::https://raw.githubusercontent.com/epi052/${gives}/v${pkgver}/shell_completions/${gives}.fish"
)
sha256sums=(
  "2c6f2804b32e28eba93b0cfd6c793e8ca4ab1e070659c447bf273a61404cee2f"
  "SKIP"
  "SKIP"
  "SKIP"
)
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  # Install bin
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"

  # Bash
  install -Dm644 "./feroxbuster.bash" "${pkgdir}/usr/share/bash-completion/completions/feroxbuster.bash"

  # Zsh
  install -Dm644 "./_feroxbuster" "${pkgdir}/usr/share/zsh/site-functions/_feroxbuster"

  # Fish
  install -Dm644 "./feroxbuster.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/feroxbuster.fish"
}
# vim:set ft=sh ts=2 sw=2 et:
