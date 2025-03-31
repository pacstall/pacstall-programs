pkgname="nutext-bin"
gives="nutext"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.3.2"
url='https://github.com/rhino-linux/nu_plugin_nutext'
source=("${url}/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.zip")
sha256sums_amd64=("69facfc5e0097e961f637cc71a420bc6f5f8bc61afa328307d5afbf807a77182")
sha256sums_arm64=("f4ec057b7df07720705045d0e719f80d8f5a6183ca086e694faad42b3a9b2842")
pkgdesc="Another translaton plugin for nushell"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pacdeps=("nushell-bin")
replaces=("${gives}-git")

package() {
  cp -r "usr" "${pkgdir}"
}
