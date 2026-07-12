pkgname="tree-sitter-cli-bin"
gives="tree-sitter-cli"
pkgver="0.26.11"
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
sha256sums_amd64=("ff1b7f9863f2faafd78dc0e66d902ee85b37f709b314b22c009f51caf233eebd")
sha256sums_arm64=("db28509fe6db8902f9d14c43c486858c7486b42c3a96b30e811e73f105762336")
sha256sums_armhf=("bcf2bbcee574b118cdeede47a8ec76b4a534d14a08cf25808b9305eb1c26b9a2")
sha256sums_i386=("1ce9e7a78acf3ccbda9f6e7efe0958738d4320b3fd0aeeae1fa4fb358342159e")

package() {
  cd "${srcdir}"
  install -Dm755 tree-sitter "${pkgdir}/usr/bin/tree-sitter"
}

# vim:set ft=sh ts=2 sw=2 et:
