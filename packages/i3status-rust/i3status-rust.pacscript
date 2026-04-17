pkgname="i3status-rust"
gives="i3status-rs"
repology=("project: i3status-rust")
arch=("any")
pkgver="0.36.0"
license=("GPL-3.0")
url='https://github.com/greshake/i3status-rust'
pkgdesc='Very resourcefriendly and feature-rich replacement for i3status, written in pure Rust'
source=("https://github.com/greshake/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
replaces=("i3status-rust" "i3status-rs")
sha256sums=("67b1a7acd229c1dc151598e286bcf357ac892575514d995489b7cb4ebc97ed6d")
pacdeps=("rust-bin")
makedepends=("pandoc" "gcc" "libssl-dev" "libsensors-dev" "libpulse-dev" "libnotmuch-dev")
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

build() {
  cd "${pkgname}-${pkgver}"
  cargo build -j"${NCPU}" --locked --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${gives}" -t "${pkgdir}/usr/bin"
}
