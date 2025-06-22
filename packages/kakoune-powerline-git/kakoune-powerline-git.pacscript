pkgname='kakoune-powerline-git'
pkgname='kakoune-powerline'
pkgver="1.1.0"
pkgdesc='Kakoune modeline, but with passion'
license=('MIT')
url='https://github.com/andreyorst/powerline.kak'
arch=("all")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
source=(
  "::https://github.com/andreyorst/powerline.kak.git"
)
sha256sums=(
  'SKIP'
)
depends=('kakoune')

prepare() {
  rm -rf "${srcdir}/powerline.kak/.git"
  rm -rf "${srcdir}/powerline.kak/.github"
}

package() {
  mkdir -p "${pkgdir}/usr/share/kak/autoload/"
  mv "${srcdir}/powerline.kak" "${pkgdir}/usr/share/kak/autoload/"
}
