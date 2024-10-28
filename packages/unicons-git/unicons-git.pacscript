pkgname="unicons-git"
source=("https://github.com/rhino-linux/unicons.git")
arch=("all")
pkgver="0.0.1"
gives="unicons"
pkgdesc="Unicorn Desktop Icons. By the Rhino Linux Team"
maintainer=("AJStrong <ajstrongdev@proton.me>")
depends=("gtk-update-icon-cache")

package() {
  cd "${gives}"
  mkdir -p "${pkgdir}/usr/share/icons/Unicons/"
  cp -r unicons/* /usr/share/icons/Unicons
}

post_install() {
  gtk-update-icon-cache "/usr/share/icons/Unicons"
}