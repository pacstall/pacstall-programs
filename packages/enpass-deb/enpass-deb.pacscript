name="enpass-deb"
pkgname="enpass"
gives="enpass"
arch=('amd64')
version="6.8.5.1173"
description="Multiplatform password manager"
url="https://apt.enpass.io/pool/main/e/enpass/${pkgname}_${version}_amd64.deb"
hash="5855e617041d73682320f3643eb4136c93eef2beaf3be9d37cbadfc76d719b5b"
depends=("libxss" "lsof" "curl" "libxkbcommon-x11" "libxcb" "xcb-util-wm" "xcb-util-image" "xcb-util-keysyms" "xcb-util-renderutil")
optdepends=('libxdg-basedir: Open links in the default browser.'
  'libqtxdg: Open links in the default browser (Qt implementation)')
repology=("project: enpass")
maintainer="smokeythemonkey <smokeythemonkey@posteo.net>"
