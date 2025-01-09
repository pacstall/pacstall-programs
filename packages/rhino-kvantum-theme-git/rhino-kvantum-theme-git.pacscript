pkgname="rhino-kvantum-theme-git"
gives="rhino-kvantum-theme"
depends=("qt6-style-kvantum | qt5-style-kvantum")
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Rhino Linux Kvantum theme"
source=("https://github.com/rhino-linux/KvRhino.git")
arch=("all")
pkgver="0.0.1"
pkgrel="2"

package() {
  cd "KvRhino"
  mkdir -p "${pkgdir}/etc/skel/.config/Kvantum"
  mv KvRhino{,Dark} "${pkgdir}/etc/skel/.config/Kvantum"
}
