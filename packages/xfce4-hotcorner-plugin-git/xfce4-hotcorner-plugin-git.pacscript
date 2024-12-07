pkgname="xfce4-hotcorner-plugin-git"
source=("https://github.com/christopherkobayashi/xfce4-hotcorner-plugin.git")
arch=("any")
pkgver="0.0.4"
gives="xfce4-hotcorner-plugin"
makedepends=("make" "libgtk-3-dev" "libwnck-3-dev" "libnotify-dev" "intltool" "libxfce4ui-2-dev" "libxfce4panel-2.0-dev")
depends=("libgtk-3-0" "libwnck-3-0" "libnotify4" "libxfce4ui-2-0" "libxfce4panel-2.0-4")
incompatible=("ubuntu:jammy")
pkgdesc="hotcorners, for XFCE"
maintainer=("Oren Klopfer <oren@taumoda.com>")

prepare() {
  cd "xfce4-hotcorner-plugin"
  ./configure --prefix="${pkgdir}/usr"
}

package() {
  cd "xfce4-hotcorner-plugin"
  make install
}
