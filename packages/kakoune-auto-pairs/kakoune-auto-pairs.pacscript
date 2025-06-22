pkgname='kakoune-auto-pairs'
_commit='e812ee6006b1c3d8c9afa45a0a90d28714636f81'
pkgver="0.0.1"
pkgdesc='Auto-pairing of characters for kakoune'
license=('Unlicense')
url='https://github.com/alexherbo2/auto-pairs.kak'
arch=("all")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
source=(
  "https://raw.githubusercontent.com/alexherbo2/auto-pairs.kak/${_commit}/rc/auto-pairs.kak"
  "https://raw.githubusercontent.com/alexherbo2/auto-pairs.kak/${_commit}/docs/auto-pairs.asciidoc"
)
sha256sums=(
  '3db933ecc594f9124425b1857965b9fbaf9111312ac74fd667764c6a1670d273'
  '87793e91e537b7db215ed0b324e4e61b92e71ccbb8b1be6c62eba6609e4edcae'
)
depends=('kakoune')

package() {
  install -Dm644 "${srcdir}/auto-pairs.kak" "${pkgdir}/usr/share/kak/autoload/auto-pairs.kak"
  install -Dm644 "${srcdir}/auto-pairs.asciidoc" "${pkgdir}/usr/share/doc/kak/auto-pairs.asciidoc"
}
