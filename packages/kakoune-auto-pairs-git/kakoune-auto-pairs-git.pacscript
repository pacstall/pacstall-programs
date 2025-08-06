pkgname='kakoune-auto-pairs-git'
gives='kakoune-auto-pairs'
pkgver="0.0.1"
pkgdesc='Auto-pairing of characters for kakoune'
license=('Unlicense')
url='https://github.com/alexherbo2/auto-pairs.kak'
arch=("all")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
source=('https://github.com/alexherbo2/auto-pairs.kak.git')
sha256sums=('SKIP')
depends=('kakoune')
enhances=('kakoune')

package() {
  install -Dm644 "${srcdir}/auto-pairs.kak/rc/auto-pairs.kak" "${pkgdir}/usr/share/kak/autoload/auto-pairs.kak"
  install -Dm644 "${srcdir}/auto-pairs.kak/docs/auto-pairs.asciidoc" "${pkgdir}/usr/share/doc/kak/auto-pairs.asciidoc"
}
