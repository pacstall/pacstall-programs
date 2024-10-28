pkgname="unicons-git"
source=("https://github.com/rhino-linux/unicons.git")
arch=("all")
pkgver="0.0.1"
gives="unicons"
pkgdesc="Unicorn Desktop Icons. By the Rhino Linux Team"
maintainer=("AJStrong <ajstrongdev@proton.me>")
depends=("gtk-update-icon-cache")

build() {
    cd "${gives}"
    mkdir -p "${pkdir}/usr/share/icons" 
}

package() {
    cd "${gives}"
    install -dm755 "${pkgdir}/usr/share/icons/unicons"
    gtk-update-icon-cache "${pkgdir}/usr/share/icons/Unicons"
}
