pkgname="xdg-terminal-exec-git"
gives="xdg-terminal-exec"
pkgver="0.10.0"
pkgdesc="Proposed standard to launching desktop apps with Terminal=true"
arch=("amd64")
url='https://github.com/Vladimir-csp'
makedepends=('git')
source=("git+$url/${gives}")
sha256sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")

package() {
  cd "${_archive}"
  install -Dm 755 -t "$pkgdir"/usr/bin "${gives}"
  install -Dm 644 -t "$pkgdir"/usr/share/doc/"${gives}"/ README.md
}
