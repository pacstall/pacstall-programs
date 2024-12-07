pkgname="fm6000-git"
arch=("any")
pkgver="0.0.1"
source=("https://github.com/anhsirk0/fetch-master-6000.git")
depends=("perl")
breaks=("fm6000")
gives="fm6000"
pkgdesc="A simple fetch tool written in Perl"
sha256sums=("d0127441a11db8d640a28753a8494a5155514e161415ca7b2c5ab3b33024517f")

build() {
  cd "fetch-master-6000"
  chmod +x fm6000.pl
}

package() {
  cd "fetch-master-6000"
  mkdir -p "${pkgdir}/usr/bin/"
  cp fm6000.pl "${pkgdir}/usr/bin"
}
