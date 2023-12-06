name="topgrade-musl-bin"
gives="topgrade"
pkgver="13.0.0"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
pkgdesc="Upgrades everything on your system"
hash="333d29341ebad8737ab3b4eff99a8f1d8035307615d974a45bead8fd31bbf67b"
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-bin")
repology=("project: ${gives}")
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
