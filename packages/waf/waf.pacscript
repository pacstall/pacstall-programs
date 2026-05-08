pkgname="waf"
arch=("any")
pkgver="2.1.9"
source=("@${pkgname}~${pkgver}::https://gitlab.com/ita1024/waf/-/archive/waf-${pkgver}/waf-waf-${pkgver}.zip")
pkgdesc="Waf is a Python-based framework for configuring, compiling and installing applications."
makedepends=("python3")
depends=("python3")
sha256sums=("47c555fb57ea72d0a2e31f13e74c2588d9686b7c4c63ce0dbbf7fb894390b720")
maintainer=("echometerain <echometer@disroot.org>")

build() {
  cd "${pkgname}~${pkgver}"
  python3 ./waf-light build --make-waf --tools='compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8,eclipse'
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "waf" "${pkgdir}/usr/bin/waf"
}
