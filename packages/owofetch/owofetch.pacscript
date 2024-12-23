pkgname="owofetch"
gives="owofetch"
pkgver="0.3.1"
pkgdesc="OwO~"
source=("@${pkgname}~${pkgver}::https://github.com/netthier/owofetch-rs/archive/refs/tags/v${pkgver}.zip")
sha256sums=("c4f8cd96751ceb932d75b98ad38c19ce5b3aad0aa274aeb5eb11e0aa89a6bd13")
breaks=("owofetch-git")
arch=('any')
makedepends=("cargo")
maintainer=("Herisson <spaceguybox@outlook.com>")
external_connection=true
repology=("project: owofetch")

package() {
  cd "${pkgname}~${pkgver}"
  cargo build -j"${NCPU}" --release --locked
  install -Dm755 ./target/release/owofetch "${pkgdir}/usr/bin/${gives}"
}
