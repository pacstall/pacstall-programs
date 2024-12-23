pkgname="shellharden"
gives="shellharden"
arch=("any")
pkgver="4.3.0"
repology=("project: ${gives}")
source=("@${pkgname}~${pkgver}::https://github.com/anordal/shellharden/archive/refs/tags/v${pkgver}.zip")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
makedepends=("rustc" "cargo")
pkgdesc="A syntax highlighter and a tool to semi-automate the rewriting of scripts to ShellCheck conformance"
sha256sums=("d6679f7a2a3e96da923b2f04339a966202a24172f1bbc58e56e7982eca2a76dc")
incompatible=('debian:bullseye')
external_connection=true
maintainer=("Elsie19 <elsie19@pm.me>")

build() {
  cd "${pkgname}~${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 target/release/shellharden "${pkgdir}"/usr/bin/shellharden
}
