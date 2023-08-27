name="rhino-kvantum-theme-git"
gives="rhino-kvantum-theme"
depends=("qt5-style-kvantum")
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Rhino Linux Kvantum theme"
url="https://github.com/rhino-linux/KvRhino.git"
pkgver="0.0.1"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

package() {
  sudo mkdir -p "${pkgdir}/etc/skel/.config/Kvantum"
  sudo mv KvRhino{,Dark} "${pkgdir}/etc/skel/.config/Kvantum"
}
