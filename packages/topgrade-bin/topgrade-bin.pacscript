name="topgrade-bin"
pkgname="topgrade"
pkgver="13.0.0"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
pkgdesc="Upgrades everything on your system"
hash="b9bbab3a2cbea68bd3476ae858a00f74a57e6224a7fbef0ed0de5273ac95affd"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git" "${pkgname}-musl-bin")
gives="${pkgname}"
repology=("project: ${pkgname}")
arch=('amd64')
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
