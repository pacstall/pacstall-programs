pkgname="rhino-calamares-settings-lomiri-git"
gives="rhino-calamares-settings-lomiri"
arch=("amd64" "arm64")
pkgver="0.0.1"
makedepends=("make")
pkgdesc="Modules and settings for the Rhino Linux calamares installer on Lomiri"
maintainer=("Elsie19 <hwengerstickel@pm.me>")
replaces=("rhino-calamares-settings")
source=("https://github.com/rhino-linux/calamares-settings.git")

package() {
  cd "calamares-settings"
  make DESTDIR="${pkgdir}" ARCH="${AARCH}" lomiri
}
