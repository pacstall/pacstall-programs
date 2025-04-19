pkgname="zinit"
gives="zinit"
arch=("amd64")
pkgver="3.14.0"
pkgdesc="Flexible and fast Zsh plugin manager"
url='https://github.com/zdharma-continuum/zinit'
license=('MIT')
depends=('git' 'curl' 'zsh')
makedepends=('make')
repology=("project: zinit")
source=("@${pkgname}~${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("4707baaad983d2ea911b4c2fddde9e7876593b3dc969a5efd9d387c9e3d03bb3")
maintainer=("Bahar KURT <kurtbahartr@gmail.com>")

package() {
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${pkgname}~${pkgver}" "${pkgdir}/usr/share/${pkgname}"
  make --directory="${pkgdir}/usr/share/${pkgname}"
}
