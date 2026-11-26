pkgname="tree-sitter-cli-bin"
gives="tree-sitter-cli"
pkgver="0.27.2"
arch=("amd64" "arm64" "armhf" "i386")
url='https://tree-sitter.github.io/tree-sitter/'
license=("MIT")
repology=("project: ${gives}")
breaks=("${gives}" "${gives}-deb" "${gives}-git")
pkgdesc="CLI for developing, testing, and using Tree-sitter grammars"
maintainer=("Don Alfons <donnisnoni@outlook.com>")
recommends=(
  "nodejs: Required for the 'generate' command"
  "node-gyp: Required for building native addons via node-gyp"
  "gcc | c-compiler: Required for building and testing parsers"
)
source_amd64=("https://github.com/tree-sitter/tree-sitter/releases/download/v${pkgver}/${gives}-linux-x64.zip")
source_arm64=("https://github.com/tree-sitter/tree-sitter/releases/download/v${pkgver}/${gives}-linux-arm64.zip")
source_armhf=("https://github.com/tree-sitter/tree-sitter/releases/download/v${pkgver}/${gives}-linux-arm.zip")
source_i386=("https://github.com/tree-sitter/tree-sitter/releases/download/v${pkgver}/${gives}-linux-x86.zip")
sha256sums_amd64=("b4233ecc4f0e648d6d8ccc4bac96c00c712ca1a5eb1e0ca7197d29b750bffa6d")
sha256sums_arm64=("4598875d129dfef384b3d78da329b766f151c2f827404fb5f3363a135935d0d3")
sha256sums_armhf=("0c5a992429f2cd0fbce1546346c7894b4dafff95a1a30bc93de05dc9700d7a7b")
sha256sums_i386=("68fcdae7c58e38ad796659ff4000310136be3794ed56dce01268458d0f3c21b0")

package() {
  cd "${srcdir}"
  install -Dm755 tree-sitter "${pkgdir}/usr/bin/tree-sitter"
}

# vim:set ft=sh ts=2 sw=2 et:
