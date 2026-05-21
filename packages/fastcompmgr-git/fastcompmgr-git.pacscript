#This script is based on asyync1024 <asyync1024@proton.me> AUR

pkgname="fastcompmgr-git"
gives="fastcompmgr"
pkgver="0.5.r20.ga449edb"
pkgrel="2"
pkgdesc="An early Compton-based compositor for X11 focused on performance. (git)"
arch=('amd64')
url="https://github.com/tycho-kirchner/fastcompmgr"
license=('MIT')
depends=(
  "libc6"
  "libx11-6"
  "libxcomposite1"
  "libxdamage1"
  "libxfixes3"
  "libxrender1"
)
makedepends=(
  "git"
  "make"
  "gcc"
  "pkg-config"
  "libc6-dev"
  "libx11-dev"
  "libxcomposite-dev"
  "libxdamage-dev"
  "libxfixes-dev"
  "libxrender-dev"
)
provides=("${gives}")
conflicts=("${gives}")
source=("https://github.com/tycho-kirchner/${gives}.git")
maintainer=("aKqir24 <aKqir24@github.com")

pkgver() {
  cd "${gives}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "${gives}"
  make -j"${NCPU}"
}

package() {
  cd "${gives}"

  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${gives}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
