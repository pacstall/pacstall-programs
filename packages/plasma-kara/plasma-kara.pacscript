pkgname="plasma-kara"
pkgdesc="KDE applet for the Plasma pager"
pkgver="0.7.3"
repology=("project: kara")
arch=("all")
breaks=("${pkgname}-git")
url='https://github.com/dhruv8sh/kara'
source=("https://github.com/dhruv8sh/kara/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("f7b794f56ec7d9056d511f0d313c354ed57246ad1c5500869c4a2f0e82bcc77b")
license=("GPL-3.0-only")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
depends=("plasma-desktop>=4:6.0.0")

package() {
  destdir="${pkgdir}/usr/local/share/plasma/plasmoids/org.dhruv8sh.kara"
  mkdir -p "${destdir}"
  cd "${srcdir}/kara-${pkgver}"
  cp -r "./contents" "./metadata.json" "${destdir}"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
