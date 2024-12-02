pkgname="waf"
arch=("any")
pkgver="2.0.24"
source=("@${pkgname}~${pkgver}::https://gitlab.com/ita1024/waf/-/archive/waf-${pkgver}/waf-waf-${pkgver}.zip")
pkgdesc="Waf is a Python-based framework for configuring, compiling and installing applications."
sha256sums=("87a468f9bf1d8a55151dda6290e230bcdad199df70217a223eb96ac79b94f121")
maintainer=("echometerain <echometer@disroot.org>")

build() {
  cd "${pkgname}~${pkgver}"
  python3 ./waf-light build --make-waf --tools='compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8,eclipse'
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "waf" "${pkgdir}/usr/bin/waf"
}

post_install() {
  sudo waf 2> "/dev/null"
}
