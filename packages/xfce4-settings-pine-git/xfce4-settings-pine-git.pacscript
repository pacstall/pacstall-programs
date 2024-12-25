pkgname="xfce4-settings-pine-git"
gives="xfce4-settings"
replaces=("${gives}")
makedepends=("xfce4-dev-tools>=4.19.0" "libexo-2-dev" "libgarcon-1-dev" "libxfce4ui-2-dev" "libxml2-utils" "autopoint")
source=("https://github.com/oklopfer/xfce4-settings.git")
arch=("any")
pkgver="4.20.0"
pkgrel="2"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="XFCE4 patch that allows Pine64 Devices to auto-rotate"

prepare() {
  cd "xfce4-settings"
  ./autogen.sh
}

build() {
  cd "xfce4-settings"
  make -j"${NCPU}"
}

package() {
  cd "xfce4-settings"
  make install DESTDIR="${pkgdir}"
  rm -f "${pkgdir}/usr/share/applications/xfce4-file-manager.desktop"
}
