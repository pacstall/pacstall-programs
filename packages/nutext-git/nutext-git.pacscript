pkgname="nutext-git"
gives="nutext"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.6.1"
url='https://github.com/rhino-linux/nu_plugin_nutext'
source=("${gives}::${url}.git")
pkgdesc="Another translaton plugin for nushell"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pacdeps=("nushell-bin")
replaces=("${gives}-bin")
makedepends=("cargo>=1.93.1")
external_connection=true

package() {
  cd "${gives}"
  make all DESTDIR="${pkgdir}"
}
