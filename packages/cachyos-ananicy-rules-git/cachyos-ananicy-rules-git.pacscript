name="cachyos-ananicy-rules-git"
pkgver="20231011"
pkgdesc="ananicy-cpp rules for CachyOS"
depends=('ananicy-cpp')
homepage="https://github.com/CachyOS/ananicy-rules"
url="${homepage}.git"
maintainer="vigress8 <vig@disroot.org>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  rm README.md LICENSE
  sudo install -Dm644 ./* -t "${pkgdir}/etc/ananicy.d"
}
