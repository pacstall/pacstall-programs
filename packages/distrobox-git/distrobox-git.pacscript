maintainer=("xdavius <xdavius@github.com>")
pkgname="distrobox-git"
gives="distrobox"
pkgver=1.7.2.1
pkgdesc="Use any linux distribution inside your terminal"
arch=('any')
url='https://github.com/89luca89/distrobox'
provides=("${pkgname}")
conflicts=("${pkgname%-git}")
makedepends=('git')
optdepends=(
  'docker.io: enable docker usage'
  'podman: enable podman usage'
)
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')
repology=("project: distrobox")

package() {
  cd "${srcdir}/${pkgname%-git}"
  ./install -P "${pkgdir}/usr"

  find docs -name "*.md" \
    -exec install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" {} +
}
