pkgname="systemcoding-conky"
gives="conky"
arch=("all")
pkgver="1.0"
source=("@${pkgname}~${pkgver}::https://github.com/systemcoding/systemcoding-conky/releases/download/release/systemcoding-conky.zip")
maintainer=("System Coding <revanthnagmunagala@gmail.com>")
makedepends=("conky" "lm-sensors")
pkgdesc="System Coding's Version Of Conky"
sha256sums=("345774e7af5ce7783a1168746243e252922cac7fe0e0b8039c272792492a365c")
breaks=("conky")

package() {
  cd "${pkgname}~${pkgver}"
  install -D conky/.conkyrc -t "${pkgdir}"
}
