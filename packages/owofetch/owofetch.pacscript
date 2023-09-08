name="owofetch"
pkgname="owofetch"
pkgver="0.3.1"
gives="owofetch"
pkgdesc="OwO~"
url="https://github.com/netthier/owofetch-rs/archive/refs/tags/v${pkgver}.zip"
hash="c4f8cd96751ceb932d75b98ad38c19ce5b3aad0aa274aeb5eb11e0aa89a6bd13"
breaks=("owofetch-git")
arch=('any')
makedepends=("cargo")
maintainer="Herisson <spaceguybox@outlook.com>"
repology=("project: owofetch")

package() {
  cargo build -j"${NCPU}" --release --locked
  sudo install -Dm755 ./target/release/owofetch "${pkgdir}/usr/bin/${pkgname}"
}
