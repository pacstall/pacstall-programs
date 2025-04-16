pkgname="lynxfetch"
arch=("amd64")
pkgver="1.0.8"
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
makedepends=("libdbus-1-dev" "pkg-config")
pacdeps=("rust-bin")
pkgdesc="Super fast, versatile, and customizable command-line fetcher"
sha512sums=("0b689cd37844c01460dfb37f84b2f4760cd34e9e210c8970e4bee549e14196f0557b77703b8b5a5efaa347117aece864f8563273482c79b36abbd8456727a296")
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
