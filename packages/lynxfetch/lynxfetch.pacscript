pkgname="lynxfetch"
arch=("amd64")
pkgver="1.1.2"
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
makedepends=("libdbus-1-dev" "pkg-config")
pacdeps=("rust-bin")
pkgdesc="Super fast, versatile, and customizable command-line fetcher"
sha512sums=("6bfa340b4ef8f3f404863a9c0a7fadceb1dd6acc77b30771c551d5671a8d49253ef67877b1ffb1ed031f83aee6845ecdd3da81ecfe3a4c512ca9acac950b1ba6")
maintainer=("CELESTIFYX Team <celestifyx@gmail.com>")
external_connection=true

build() {
  cd "${pkgname}-${pkgver}"

  cargo build -j"${NCPU}" --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"

  install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "completions/${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
