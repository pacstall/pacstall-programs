pkgname="framework-system-bin"
pkgver="0.6.1"
pkgdesc="Tools to interact with the Framework Computer systems"
url='https://github.com/FrameworkComputer/framework-system'
arch=("amd64")
license=("BSD-3-Clause")
maintainer=("Elsie19 <hwengerstickel@pm.me>")
source=("https://github.com/FrameworkComputer/framework-system/releases/download/v${pkgver}/framework_tool")
sha256sums=("51665b79752c6bb7a41fc41436eca90db83ebdb51e411fecc2a778729e634207")
repology=("project: framework-system")

package() {
  install -Dm 755 framework_tool -t "${pkgdir}/usr/bin"
}
