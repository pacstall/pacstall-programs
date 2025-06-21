pkgname="waf"
arch=("any")
pkgver="2.1.6"
source=("@${pkgname}~${pkgver}::https://gitlab.com/ita1024/waf/-/archive/waf-${pkgver}/waf-waf-${pkgver}.zip")
pkgdesc="Waf is a Python-based framework for configuring, compiling and installing applications."
makedepends=("python3")
depends=("python3")
sha256sums=("1bf7c726fb693fbf3e754e757c0cd0133a3159156518d42d6579c4ad88c607e0")
maintainer=("echometerain <echometer@disroot.org>")

build() {
  cd "${pkgname}~${pkgver}"
  python3 ./waf-light build --make-waf --tools='compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8,eclipse'
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "waf" "${pkgdir}/usr/bin/waf"
}
