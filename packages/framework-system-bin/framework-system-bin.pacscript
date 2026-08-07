pkgname="framework-system-bin"
pkgver="0.6.5"
pkgdesc="Tools to interact with the Framework Computer systems"
url='https://github.com/FrameworkComputer/framework-system'
arch=("amd64")
license=("BSD-3-Clause")
maintainer=("Elsie19 <elsie19@pm.me>")
source=("https://github.com/FrameworkComputer/framework-system/releases/download/v${pkgver}/framework_tool")
sha256sums=("0b223b09dbf0c05cfd18878e0be113294e35ea32120b93de1888a26cf6595cfc")
repology=("project: framework-system")

package() {
  install -Dm 755 framework_tool -t "${pkgdir}/usr/bin"
}
