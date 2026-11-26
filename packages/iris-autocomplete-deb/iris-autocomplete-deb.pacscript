pkgname="iris-autocomplete-deb"
gives="iris"
pkgver="0.7.3"
url='https://github.com/versenilvis/IRIS'
pkgdesc="Shell auto-completion tool for your terminal"
repology=("project: ${gives}-autocomplete")
arch=('amd64' 'arm64')
maintainer=("aKqir24 <aKqir24@github.com>")
license=("0BSD")
sha256sums_amd64=("e0d922d46d62afac92af5eacf348cb8d685cd0103e08f961c7bcffc1febce6ab")
sha256sums_arm64=("e0de107ad5e681d826a06e5b1886b0ce837ffa4d2859dbaee6e1659c9b99fe59")
source_amd64=("${url}/releases/download/v${pkgver}/iris_linux_amd64.deb")
source_arm64=("${url}/releases/download/v${pkgver}/iris_linux_arm64.deb")
replaces=("fzf" "atuin" "zsh-autosuggestions" "bash-completion")

post_install() {
  iris setup
  iris config init
  iris theme init
}

# vim:set ft=sh ts=2 sw=2 et:
