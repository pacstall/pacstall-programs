pkgname="shellharden"
gives="shellharden"
arch=("any")
pkgver="4.3.2"
repology=("project: ${gives}")
source=("@${pkgname}~${pkgver}::https://github.com/anordal/shellharden/archive/refs/tags/v${pkgver}.zip")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
makedepends=("rustc" "cargo")
pkgdesc="A syntax highlighter and a tool to semi-automate the rewriting of scripts to ShellCheck conformance"
sha256sums=("8f2277e45e2f120f9bf2c4bb5c387ad08d0a2c7f8c39dbb549b692eaf6a8ef65")
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
