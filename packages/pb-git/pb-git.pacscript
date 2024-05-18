pkgname="pb-git"
pkgver="2022.11.03"
pkgdesc="0x0 pastebin utility"
maintainer=("vigress8 <vig@disroot.org>")
source=("https://git.envs.net/envs/pb.git")

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
