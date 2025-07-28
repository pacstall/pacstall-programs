pkgname="pb-git"
arch=("all")
pkgver="2022.11.03"
pkgdesc="0x0 pastebin utility"
source=("https://git.envs.net/envs/pb.git")

package() {
  cd "pb"
  make install DESTDIR="${pkgdir}"
}
