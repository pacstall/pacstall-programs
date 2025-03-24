pkgname="lynxfetch"
arch=("amd64")
pkgver="1.0.7"
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
makedepends=("libdbus-1-dev" "pkg-config")
pacdeps=("rust-bin")
pkgdesc="Super fast, versatile, and customizable command-line fetcher"
sha512sums=("c89b605b628d3606a5d092e9fc157bc51567c1a7e976660c95395ee3c9461b46")
maintainer=("CELESTIFYX Team <celestifyx@gmail.com>")
external_connection=true

build() {
  cd "${pkgname}-${pkgver}"

  cargo build -j"${NCPU}" --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}
