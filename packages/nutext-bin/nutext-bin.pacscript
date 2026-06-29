pkgname="nutext-bin"
gives="nutext"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.6.1"
url='https://github.com/rhino-linux/nu_plugin_nutext'
source=("${url}/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.zip")
sha256sums_amd64=("e072ecb1a0a66814a8ac8a9785ce337c8bbb78b31f454e76a21d3fb85afde73f")
sha256sums_arm64=("0def9046928594bede77755b187693a497623b8b6dc90753c30349df3fbaee16")
pkgdesc="Another translaton plugin for nushell"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pacdeps=("nushell-bin")
replaces=("${gives}-git")

package() {
  cp -r "usr" "${pkgdir}"
}
