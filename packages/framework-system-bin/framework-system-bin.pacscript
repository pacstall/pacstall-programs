pkgname="framework-system-bin"
pkgver="0.5.0"
pkgdesc="Tools to interact with the Framework Computer systems"
url='https://github.com/FrameworkComputer/framework-system'
arch=("amd64")
license=("BSD-3-Clause")
maintainer=("Elsie19 <hwengerstickel@pm.me>")
source=("https://github.com/FrameworkComputer/framework-system/releases/download/v${pkgver}/framework_tool")
sha256sums=("920283caef7466e224d52be7b90eba1ca616c391f23ad581e874ff09f81f11bc")
repology=("project: framework-system")

package() {
  install -Dm 755 framework_tool -t "${pkgdir}/usr/bin"
}
