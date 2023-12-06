name="topgrade-bin"
gives="topgrade"
pkgver="13.0.0"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
pkgdesc="Upgrades everything on your system"
hash="b9bbab3a2cbea68bd3476ae858a00f74a57e6224a7fbef0ed0de5273ac95affd"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-musl-bin")
repology=("project: ${gives}")
arch=('amd64')
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
