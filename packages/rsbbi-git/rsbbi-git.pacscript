pkgname="rsbbi-git"
pkgrel="2"
gives="rsbbi"
makedepends=("cargo" "rustc" "pkg-config" "librust-openssl-dev")
pkgdesc="A Rust-Based Rabbi, using Sefaria's API"
source=("https://github.com/Elsie19/rsbbi.git")
arch=("any")
pkgver="0.0.1"
maintainer=(
  "Elsie19 <elsie19@pm.me>"
  "Oren Klopfer <oren@taumoda.com>"
)
external_connection=true
incompatible=("debian:bookworm")

build() {
  cd "${gives}"
  cargo build -j"${NCPU}" --locked --release
}

package() {
  install -Dm755 "${gives}/target/release/${gives}" -t "${pkgdir}/usr/bin"
}
