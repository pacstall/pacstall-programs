maintainer=("xdavius <xdavius@github.com>")
pkgname="distrobox-git"
gives="distrobox"
pkgver=2.0.0-rc.4
pkgdesc="Use any linux distribution inside your terminal"
arch=('any')
url='https://github.com/89luca89/distrobox'
provides=("${pkgname}")
conflicts=("${pkgname%-git}")
makedepends=('git')
external_connection=true
optdepends=(
  'docker.io: enable docker usage'
  'podman: enable podman usage'
)
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')
repology=("project: distrobox")

package() {
  cd "${srcdir}/${pkgname%-git}"
  ./install -P "${pkgdir}/usr" --v2 --version "${pkgver}"

  find docs -name "*.md" \
    -exec install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" {} +
}
