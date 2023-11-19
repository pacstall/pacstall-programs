name="pb"
pkgver="0.0.1"
pkgdesc="0x0 pastebin utility"
maintainer="vigress8 <vig@disroot.org>"
url="https://git.envs.net/envs/pb.git"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  git clone "${url}"
}

package() {
  cd "${name}"
  sudo make install DESTDIR="${pkgdir}"
}
