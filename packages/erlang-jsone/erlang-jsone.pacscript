_lib='jsone'
pkgname="erlang-${_lib}"
pkgver='1.9.0'
pkgdesc='Erlang JSON library'
arch=('any')
repology=("project: ${pkgname}")
url='https://github.com/sile/jsone'
license=('MIT')
depends=('erlang')
makedepends=('git' 'make' 'rebar3')
conflicts=("${pkgname}-git")
source=("https://github.com/sile/jsone/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('677d9dd6d613f05dd9a13537769f0f50d3a855a89bf87703024eb909d070c445')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')

build() {
  make -C "${srcdir}/${_lib}-${pkgver}" compile
}

check() {
  make -C "${srcdir}/${_lib}-${pkgver}" eunit
  make -C "${srcdir}/${_lib}-${pkgver}" dialyze
}

package() {
  install -Dm644 "${srcdir}/${_lib}-${pkgver}/_build/default/lib/${_lib}/ebin/${_lib}.app" "${pkgdir}/usr/lib/erlang/lib/${_lib}-${pkgver}/ebin/${_lib}.app"
  install -Dm644 "${srcdir}/${_lib}-${pkgver}/_build/default/lib/${_lib}/ebin/${_lib}.beam" "${pkgdir}/usr/lib/erlang/lib/${_lib}-${pkgver}/ebin/${_lib}.beam"
  install -Dm644 "${srcdir}/${_lib}-${pkgver}/_build/default/lib/${_lib}/ebin/${_lib}_decode.beam" "${pkgdir}/usr/lib/erlang/lib/${_lib}-${pkgver}/ebin/${_lib}_decode.beam"
  install -Dm644 "${srcdir}/${_lib}-${pkgver}/_build/default/lib/${_lib}/ebin/${_lib}_encode.beam" "${pkgdir}/usr/lib/erlang/lib/${_lib}-${pkgver}/ebin/${_lib}_encode.beam"
  install -Dm644 "${srcdir}/${_lib}-${pkgver}/_build/default/lib/${_lib}/ebin/${_lib}_inet.beam" "${pkgdir}/usr/lib/erlang/lib/${_lib}-${pkgver}/ebin/${_lib}_inet.beam"
}
