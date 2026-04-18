pkgname="erlfmt"
pkgver="1.8.0"
pkgdesc="Automated code formatter for Erlang"
arch=('any')
repology=("project: ${pkgname}")
url='https://github.com/WhatsApp/erlfmt'
license=('Apache-2.0')
depends=('erlang')
makedepends=('git' 'rebar3')
conflicts=("${pkgname}-git")
source=("https://github.com/WhatsApp/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c7205f3a28dac589c623f21546d63d5b04cc669545d03485cb88552de0117f43')
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
external_connection=true

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rebar3 as release escriptize
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rebar3 ct
  rebar3 dialyzer
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/_build/release/bin/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
}
