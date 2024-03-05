name="systemcoding-conky"
pkgname="conky"
pkgver="1.0"
source=("https://github.com/systemcoding/systemcoding-conky/releases/download/release/systemcoding-conky.zip")
maintainer="System Coding <revanthnagmunagala@gmail.com>"
makedepends=("conky" "lm-sensors")
gives="conky"
pkgdesc="System Coding's Version Of Conky"
hash=("345774e7af5ce7783a1168746243e252922cac7fe0e0b8039c272792492a365c")
breaks=("conky")

package() {
  sudo install -D conky/.conkyrc -t "${pkgdir}"
}
