pkgname="nutext-git"
gives="nutext"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.6.2"
url='https://github.com/rhino-linux/nu_plugin_nutext'
source=("${gives}::${url}.git")
pkgdesc="Another translaton plugin for nushell"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pacdeps=("nushell-bin")
replaces=("${gives}-bin")
makedepends=("cargo>=1.95.0 | rustup")
external_connection=true

package() {
  cd "${gives}"
  export RUSTUP_TOOLCHAIN=stable
  make all DESTDIR="${pkgdir}"
}
