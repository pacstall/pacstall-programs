name="shellharden"
gives="shellharden"
pkgver="4.3.0"
repology=("project: ${gives}")
url="https://github.com/anordal/shellharden/archive/refs/tags/v${pkgver}.zip"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
makedepends=("rustc" "cargo")
pkgdesc="A syntax highlighter and a tool to semi-automate the rewriting of scripts to ShellCheck conformance"
hash="d6679f7a2a3e96da923b2f04339a966202a24172f1bbc58e56e7982eca2a76dc"
incompatible=('debian:bullseye')
maintainer="Elsie19 <elsie19@pm.me>"

build() {
  cargo build --release
}

package() {
  sudo install -Dm755 target/release/shellharden "${pkgdir}"/usr/bin/shellharden
}
