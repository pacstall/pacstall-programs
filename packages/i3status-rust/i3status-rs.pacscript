pkgname=("i3status-rust" "i3status-rs")
repology=("project: i3status-rust")
arch=("any")
pkgver="0.34.0"
license=("GPL-3.0")
url='https://github.com/greshake/i3status-rust'
pkgdesc='Very resourcefriendly and feature-rich replacement for i3status, written in pure Rust'
source=("https://github.com/greshake/${pkgname[0]}/archive/refs/tags/v${pkgver}.tar.gz")
replaces=("i3status-rust" "i3status-rs")
sha256sums=("6787174f749f15e9e177a7730f6abeae05de2b156922f6d02e512b31f35d1d17")
makedepends=("cargo>=1.85.0" "pandoc" "gcc" "libssl-dev" "libsensors-dev" "libpulse-dev" "libnotmuch-dev")
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

build() {
  cd "${pkgname[0]}-${pkgver}"
  cargo build -j"${NCPU}" --locked
}

package() {
  cd "${pkgname[0]}-${pkgver}" && ./install.sh
  install -Dm755 "target/debug/${pkgname[1]}" -t "${pkgdir}/usr/bin"
}

