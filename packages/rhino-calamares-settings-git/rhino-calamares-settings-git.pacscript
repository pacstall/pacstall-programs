pkgname="rhino-calamares-settings-git"
gives="rhino-calamares-settings"
arch=("all")
pkgver="0.0.1"
makedepends=("make")
pkgdesc="Modules and settings for the Rhino Linux calamares installer"
maintainer=("Elsie19 <hwengerstickel@pm.me>")
source=("https://github.com/rhino-linux/calamares-settings.git")

package() {
  make DESTDIR="${pkgdir}" install
}
