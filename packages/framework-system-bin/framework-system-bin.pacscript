pkgname="framework-system-bin"
pkgver="0.4.5"
pkgdesc="Tools to interact with the Framework Computer systems"
url='https://github.com/FrameworkComputer/framework-system'
arch=("amd64")
license=("BSD-3-Clause")
maintainer=("Elsie19 <hwengerstickel@pm.me>")
source=("https://github.com/FrameworkComputer/framework-system/releases/download/v${pkgver}/framework_tool")
sha256sums=("e94af70b2a287577c3d7e26e92e1a3910bd27b725543ac5763b7cd348d8fb57d")
repology=("project: framework-system")

package() {
  install -Dm 755 framework_tool -t "${pkgdir}/usr/bin"
}
