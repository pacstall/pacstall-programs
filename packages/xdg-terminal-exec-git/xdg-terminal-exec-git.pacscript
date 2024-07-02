pkgname="xdg-terminal-exec-git"
gives="xdg-terminal-exec"
pkgver="0.10.0"
pkgdesc="Proposed standard to launching desktop apps with Terminal=true"
arch=("amd64")
url='https://github.com/Vladimir-csp/xdg-terminal-exec'
makedepends=('git')
source=("git+https://github.com/Vladimir-csp/xdg-terminal-exec")
sha256sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")

package() {
  cd "${gives}"
  install -Dm 755 -t "${pkgdir}"/usr/bin "${gives}"
  install -Dm 644 -t "${pkgdir}"/usr/share/doc/"${gives}"/ README.md
}
