pkgname='kakoune-kakboard-git'
pkgver="0.0.1"
pkgdesc='Clipboard integration for Kakoune'
gives='kakoune-kakboard'
license=('MIT')
url='https://github.com/lePerdu/kakboard'
arch=("all")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
source=("${gives}::https://github.com/lePerdu/kakboard.git")
depends=('kakoune')
enhances=('kakoune')
optdepends=(
  'wl-clipboard: for Wayland clipboard integration'
  'xclip: for X11 clipboard integration'
  'xsel: for X11 clipboard integration'
)

package() {
  install -Dm644 "${srcdir}/${gives}/kakboard.kak" "${pkgdir}/usr/share/kak/autoload/kakboard.kak"
  install -Dm644 "${srcdir}/${gives}/LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
}
