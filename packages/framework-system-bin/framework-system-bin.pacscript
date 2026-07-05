pkgname="framework-system-bin"
pkgver="0.6.4"
pkgdesc="Tools to interact with the Framework Computer systems"
url='https://github.com/FrameworkComputer/framework-system'
arch=("amd64")
license=("BSD-3-Clause")
maintainer=("Elsie19 <elsie19@pm.me>")
source=("https://github.com/FrameworkComputer/framework-system/releases/download/v${pkgver}/framework_tool")
sha256sums=("83b04df1fbd950c88bb569e91503cbf7a616663ad7ff6cbcb0e99a67509a8584")
repology=("project: framework-system")

package() {
  install -Dm 755 framework_tool -t "${pkgdir}/usr/bin"
}
