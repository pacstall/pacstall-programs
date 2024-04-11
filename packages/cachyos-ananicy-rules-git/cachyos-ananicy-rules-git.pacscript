pkgname="cachyos-ananicy-rules-git"
gives="cachyos-ananicy-rules"
pkgver="0.0.1"
pkgdesc="ananicy-cpp rules for CachyOS"
pacdeps=('ananicy-cpp')
homepage='https://github.com/CachyOS/ananicy-rules'
source=("https://github.com/CachyOS/ananicy-rules.git")
maintainer=("vigress8 <vig@disroot.org>")

package() {
  cd "${_archive}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
  rm -f README.md LICENSE
  install -d "${pkgdir}/etc/ananicy.d"
  cp -rf ./* "${pkgdir}/etc/ananicy.d"
}
