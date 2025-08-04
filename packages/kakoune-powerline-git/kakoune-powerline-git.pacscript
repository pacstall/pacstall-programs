pkgname='kakoune-powerline-git'
gives='kakoune-powerline'
conflicts=("${gives}")
pkgver="1.1.0"
pkgdesc='Kakoune plugin to change the modeline to a vim-powerline inspired one'
license=('MIT')
url='https://github.com/andreyorst/powerline.kak'
arch=("all")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
source=('https://github.com/andreyorst/powerline.kak.git')
sha256sums=('SKIP')
depends=('kakoune')
enhances=('kakoune')

prepare() {
  rm -rf "${srcdir}/powerline.kak/.git" \
    "${srcdir}/powerline.kak/.github"
}

package() {
  mkdir -p "${pkgdir}/usr/share/kak/autoload/"
  mv "${srcdir}/powerline.kak" "${pkgdir}/usr/share/kak/autoload/"
}
