pkgname="unicons-git"
source=("https://github.com/rhino-linux/unicons.git")
arch=("all")
pkgver="0.0.1"
gives="unicons"
pkgdesc="Unicorn Desktop Icons. By the Rhino Linux Team"
maintainer=("AJStrong <ajstrongdev@proton.me>")
depends=("gtk-update-icon-cache")

prepare() {
  mkdir -p "${pkgdir}/usr/share/icons/Unicons/"
}

package() {
  cp -r "${gives}"/* "${pkgdir}/usr/share/icons/Unicons"
  gtk-update-icon-cache "${pkgdir}/usr/share/icons/Unicons"
}
