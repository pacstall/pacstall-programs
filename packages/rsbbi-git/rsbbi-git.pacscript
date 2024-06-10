pkgname="rsbbi-git"
gives="rsbbi"
makedepends=("cargo" "rustc" "pkg-config" "librust-openssl-dev")
pkgdesc="A Rust-Based Rabbi, using Sefaria's API"
source=("https://github.com/Elsie19/rsbbi.git")
pkgver="0.0.1"
maintainer=(
  "Elsie19 <elsie19@pm.me>"
  "Oren Klopfer <oren@taumoda.com>"
)
external_connection=true

build() {
  cd "${gives}"
  cargo build -j"${NCPU}" --locked
}

package() {
  install -Dm755 "${gives}/target/debug/${gives}" -t "${pkgdir}/usr/bin"
}
