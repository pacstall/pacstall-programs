pkgname="nutext-bin"
gives="nutext"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.3.4"
url='https://github.com/rhino-linux/nu_plugin_nutext'
source=("${url}/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.zip")
sha256sums_amd64=("698717b579cc5522db0cc873c219b7ab8f3a921e9862ddb8b6f09d6dd4d6511f")
sha256sums_arm64=("dc25c706b57eb557501daeff7f7f021222a1a3447a879989ffc1481027a3bddb")
pkgdesc="Another translaton plugin for nushell"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pacdeps=("nushell-bin")
replaces=("${gives}-git")

package() {
  cp -r "usr" "${pkgdir}"
}
