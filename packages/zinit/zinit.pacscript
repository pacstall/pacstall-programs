pkgname="zinit"
gives="zinit"
arch=("amd64")
pkgver="3.13.1"
pkgdesc="A flexible and fast Zsh plugin manager"
url='https://github.com/zdharma-continuum/zinit'
license=('MIT')
depends=('git' 'curl' 'zsh')
makedepends=('make')
repology=("project: zinit")
source=("@${pkgname}~${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("41359f41815a6461cab50ff5ba0b94dc40adcdb3646c9e71021064146a2a336a")
maintainer=("Bahar KURT <kurtbahartr@gmail.com>")

package() {
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${pkgname}~${pkgver}" "${pkgdir}/usr/share/${pkgname}"
  make --directory="${pkgdir}/usr/share/${pkgname}"
}
