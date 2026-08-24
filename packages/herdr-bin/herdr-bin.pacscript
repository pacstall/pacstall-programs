pkgname="herdr-bin"
gives="herdr"
pkgver="0.8.2"
repology=("project: herdr")
arch=("amd64" "arm64")
url='https://herdr.dev'
bugs='https://github.com/ogulcancelik/herdr/issues'
pkgdesc="Supervise multiple coding agents in one terminal"
conflicts=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
maintainer=("Jochen Hörmann <jochen.hoermann@gmail.com>")
provides=("${gives}")
license=("AGPL-3.0-or-later")
source_amd64=("${gives}::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
sha256sums_amd64=("976150a14d490c94b243ea2e1a7eb2dfb67f12e36b182db90936f6728e6aecf4")
source_arm64=("${gives}::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_arm64=("f55610658e1c2e0d2aaef730b4b2ab885f7f8ba00285ab372bfb14f2e3d5b40d")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
