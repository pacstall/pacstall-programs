pkgname="topgrade-bin"
gives="topgrade"
pkgver="13.0.0"
arch=('amd64' 'arm64')
sha256sums_amd64=("b9bbab3a2cbea68bd3476ae858a00f74a57e6224a7fbef0ed0de5273ac95affd")
sha256sums_arm64=("5079a1f50f2fd2d7954639f5eb14db38094f78493e2292a945f9f5ac60bfff5d")
source_amd64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_arm64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
pkgdesc="Upgrades everything on your system"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-musl-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
