pkgname="age-plugin-yubikey"
pkgver="0.5.1"
pkgrel="1"
pkgdesc="YubiKey plugin for age clients"
arch=("amd64" "arm64")
url="https://github.com/str4d/age-plugin-yubikey"
license=("Apache-2.0" "MIT")
maintainer=("Abhinandan <dev@nmabhinandan.xyz>")
repology=("project: age-plugin-yubikey")
external_connection=true

depends=(
  "pcscd"
  "libpcsclite1"
)

makedepends=(
  "cargo"
  "libpcsclite-dev"
  "pkg-config"
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/str4d/age-plugin-yubikey/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
  cd "${pkgname}-${pkgver}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/age-plugin-yubikey" \
    "${pkgdir}/usr/bin/age-plugin-yubikey"

  install -Dm644 "LICENSE-APACHE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

  install -Dm644 "LICENSE-MIT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
