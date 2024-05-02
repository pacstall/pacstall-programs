pkgname="enpass-deb"
gives="enpass"
arch=('amd64')
pkgver="6.9.0.1467"
pkgdesc="Multiplatform password manager"
source=("https://apt.enpass.io/pool/main/e/enpass/${gives}_${pkgver}_amd64.deb")
sha256sums=("fe405f7119d45822164da3ad009b99c5cd516685198c1d335b7803d84e5ba2ca")
depends=("libxss" "lsof" "curl" "libxkbcommon-x11" "libxcb" "xcb-util-wm" "xcb-util-image" "xcb-util-keysyms" "xcb-util-renderutil")
optdepends=('libxdg-basedir: Open links in the default browser.'
  'libqtxdg: Open links in the default browser (Qt implementation)')
repology=("project: enpass")
maintainer=("smokeythemonkey <smokeythemonkey@posteo.net>")
