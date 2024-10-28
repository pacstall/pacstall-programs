pkgname="unicons-git"
source=("https://github.com/rhino-linux/unicons.git")
arch=("all")
pkgver="0.0.1"
gives="unicons"
pkgdesc="Icon pack for Unicorn Desktop by the Rhino Linux Team"
maintainer=("AJStrong <ajstrongdev@proton.me>")
depends=("gtk-update-icon-cache")

prepare() {
  mkdir -p "${pkgdir}/usr/share/icons/Unicons/"
}

package() {
  cp -r "${gives}"/* "${pkgdir}/usr/share/icons/Unicons"
}

post_install() {
  gtk-update-icon-cache "/usr/share/icons/Unicons"
}
