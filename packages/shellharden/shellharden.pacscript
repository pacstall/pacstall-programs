pkgname="shellharden"
gives="shellharden"
arch=("any")
pkgver="4.3.1"
repology=("project: ${gives}")
source=("@${pkgname}~${pkgver}::https://github.com/anordal/shellharden/archive/refs/tags/v${pkgver}.zip")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
makedepends=("rustc" "cargo")
pkgdesc="A syntax highlighter and a tool to semi-automate the rewriting of scripts to ShellCheck conformance"
sha256sums=("27a34b2ec942d017af4f632980f9607b7b880e0ff00362981e14c627bfe0bba7")
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
