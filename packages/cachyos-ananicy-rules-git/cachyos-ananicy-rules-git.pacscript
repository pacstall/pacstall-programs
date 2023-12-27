name="cachyos-ananicy-rules-git"
gives="cachyos-ananicy-rules"
pkgver="0.0.1"
pkgdesc="ananicy-cpp rules for CachyOS"
pacdeps=('ananicy-cpp')
homepage="https://github.com/CachyOS/ananicy-rules"
url="${homepage}.git"
maintainer="vigress8 <vig@disroot.org>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
  rm -f README.md LICENSE
  sudo install -d "${pkgdir}/etc/ananicy.d"
  sudo cp -rf ./* "${pkgdir}/etc/ananicy.d"
}
