pkgname="nowpm"
arch=("any")
pkgver="1.0"
source=("@${pkgname}~${pkgver}::https://github.com/jnats/nowpm/archive/refs/tags/v${pkgver}.zip")
pkgdesc="the no-bullshit wpm utility"
depends=("wdiff")
breaks=("foo")
sha256sums=("293e22e3ccdffd3e5db70ff025f66369d6550a1ea7fc18af538bc8d83f91b790")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x nowpm
  mv nowpm "${pkgdir}/usr/bin"
}
