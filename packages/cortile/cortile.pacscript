pkgname="cortile"
pkgver="2.5.2"
maintainer=("AJStrong <ajstrongdev@proton.me>")
pkgdesc="Linux auto tiling manager with hot corner support"
replaces=("${pkgname}-bin" "${pkgname}-git")
arch=('any')
url='https://github.com/leukipp/cortile'
repology=("project: cortile")
source=("cortile-${pkgver}::https://github.com/leukipp/cortile/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6d5ea7c542093c109cbf0b23866aa154f49b7637d2f02d7d0467c38a4f114b01")
makedepends=("golang")
incompatible=("debian:bookworm")
external_connection=true

build() {
  cd "cortile-${pkgver}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-X 'main.flags=disable-dbus-interface,disable-release-info'"
}

package() {
  cd "cortile-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
