pkgname="lynxfetch"
arch=("amd64")
pkgver="1.1.1"
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
makedepends=("libdbus-1-dev" "pkg-config")
pacdeps=("rust-bin")
pkgdesc="Super fast, versatile, and customizable command-line fetcher"
sha512sums=("ba05ba6e1b652094c4ec1849dc6d31858c0d4141a5fb362c6a5224bbfb459f71abe29901b2263a85ab3df6cbef273b9e5d16879b1d76fff476f53ac410ba8e2c")
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
