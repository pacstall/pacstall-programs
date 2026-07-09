pkgname="tree-sitter-cli-bin"
gives="tree-sitter-cli"
pkgver="0.26.10"
arch=("amd64" "arm64" "armhf" "i386")
url='https://tree-sitter.github.io/tree-sitter/'
license=("MIT")
repology=("project: ${gives}")
breaks=("${gives}" "${gives}-deb" "${gives}-git")
pkgdesc="A CLI for developing, testing, and using Tree-sitter grammars"
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
sha256sums_amd64=("5aca1172aae08050d0d1184046377d850c04065205185ebafde361afff8d9f62")
sha256sums_arm64=("6a455e6c0c21ddb732d182e3c46e3a8ca1121718254ce684a9dc730ff2367e02")
sha256sums_armhf=("dbe92018186e33ee8eaaec220663acd9afba8a8c823e9a30ced1bc8acf315c3d")
sha256sums_i386=("e639f6a8715edbecb618e042f2adaad644f44bdabbe28c49d815a556b34887d9")

package() {
  cd "${srcdir}"
  install -Dm755 tree-sitter "${pkgdir}/usr/bin/tree-sitter"
}

# vim:set ft=sh ts=2 sw=2 et:
