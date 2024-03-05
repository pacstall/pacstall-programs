name="fm6000-git"
pkgver="0.0.1"
source=("https://github.com/anhsirk0/fetch-master-6000.git")
depends=("perl")
breaks=("fm6000")
gives="fm6000"
pkgdesc="A simple fetch tool written in Perl"
hash=("d0127441a11db8d640a28753a8494a5155514e161415ca7b2c5ab3b33024517f")

build() {
  chmod +x fm6000.pl
}

package() {
  sudo mkdir -p "${pkgdir}/usr/bin/"
  sudo cp fm6000.pl "${pkgdir}/usr/bin"
}
