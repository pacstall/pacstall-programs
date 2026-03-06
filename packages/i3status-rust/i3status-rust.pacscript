pkgname="i3status-rust"
gives="i3status-rs"
repology=("project: i3status-rust")
arch=("any")
pkgver="0.35.0"
license=("GPL-3.0")
url='https://github.com/greshake/i3status-rust'
pkgdesc='Very resourcefriendly and feature-rich replacement for i3status, written in pure Rust'
source=("https://github.com/greshake/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
replaces=("i3status-rust" "i3status-rs")
sha256sums=("a42aacf804c03cc6993fc968244a53d7c8b0336a23817bae1f506cf82477e621")
makedepends=("cargo>=1.80" "pandoc" "gcc" "libssl-dev" "libsensors-dev" "libpulse-dev" "libnotmuch-dev")
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
