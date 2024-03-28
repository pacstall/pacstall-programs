pkgname="nowpm"
pkgver="1.0"
source=("https://github.com/jnats/nowpm/archive/refs/tags/v${pkgver}.zip")
pkgdesc="the no-bullshit wpm utility"
depends=("wdiff")
breaks=("foo")
sha256sums=("293e22e3ccdffd3e5db70ff025f66369d6550a1ea7fc18af538bc8d83f91b790")

package() {
  cd "${_archive}"
  sudo mkdir -p "${pkgdir}/usr/bin"
  chmod +x nowpm
  sudo mv nowpm "${pkgdir}/usr/bin"
}
