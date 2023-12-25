name="cachyos-ananicy-rules-git"
gives="cachyos-ananicy-rules"
pkgver="20231011"
pkgdesc="ananicy-cpp rules for CachyOS"
pacdeps=('ananicy-cpp')
homepage="https://github.com/CachyOS/ananicy-rules"
url="${homepage}.git"
maintainer="vigress8 <vig@disroot.org>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  rm README.md LICENSE
  sudo mkdir -p "${pkgdir}/etc/ananicy.d"
  sudo cp -r --preserve=mode ./* "${pkgdir}/etc/ananicy.d"
}
