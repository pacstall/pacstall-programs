pkgname="rhino-wallpapers-git"
gives="rhino-wallpapers"
source=("https://github.com/rhino-linux/wallpapers.git")
arch=("all")
pkgver="0.0.1"
pkgrel="2"
pkgdesc="Default Rhino Linux wallpapers"
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  mkdir -p "${pkgdir}/usr/share/wallpapers/rhino/"
  cp -rv wallpapers/* "${pkgdir}/usr/share/wallpapers/rhino/"
}
