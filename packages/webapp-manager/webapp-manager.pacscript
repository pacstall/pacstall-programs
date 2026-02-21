pkgname="webapp-manager"
arch=("all")
pkgver="1.4.6"
makedepends=("gettext")
depends=("gir1.2-xapp-1.0" "python3" "python3-bs4" "python3-configobj" "python3-gi" "python3-setproctitle" "python3-tldextract" "xapps-common" "python3-pil" "libglib2.0-bin")
pkgdesc="Run websites as if they were apps"
repology=("project: webapp-manager")
sha256sums=("14834bca23a8b961c84c478cf9068f92cc6a5bb3a02fa2f2db9b37d348536931")
incompatible=("*:jammy" "*:bullseye")
source=("@${pkgname}~${pkgver}::https://github.com/linuxmint/webapp-manager/archive/refs/tags/${pkgver}.tar.gz")
maintainer=("Zahrun <zahrunAtmurenaDotio>")

prepare() {
  cd "${pkgname}~${pkgver}"
  # Silent build
  sed -i 's/@echo/#/g' Makefile
  # Fix typo
  sed -i 's/range(4)/range(5)/g' "usr/lib/${pkgname}/common.py"
  # Fix desktop file
  mv usr/share/applications/kde4/webapp-manager.desktop usr/share/applications/webapp-manager-kde.desktop
  # Fix version
  sed -i "s/__DEB_VERSION__/${pkgver}/g" usr/lib/webapp-manager/webapp-manager.py
}

build() {
  cd "${pkgname}~${pkgver}"
  make all -s
}

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}"
  cp -r usr etc "${pkgdir}"
}

post_install() {
  sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
}
