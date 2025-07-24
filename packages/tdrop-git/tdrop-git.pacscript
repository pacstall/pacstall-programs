pkgname="tdrop-git"
gives="tdrop"
source=("https://github.com/noctuid/tdrop.git")
arch=("any")
pkgver="0.5.0"
url='https://github.com/noctuid/tdrop'
pkgdesc="A Glorified WM-Independent Dropdown Creator"
maintainer=("Thomas Crha <thomas@9bitbyte.com>")
depends=("xdotool" "bash" "gawk" "procps" "x11-utils")
optdepends=(
  "x11-xserver-utils: multiple monitor resizing support (for -m)"
  "tmux: session starting support (for -s)"
  "tmuxinator: additional session support for tmux (for -s)"
)
prepare() {
  cd "tdrop"
  gzip -9n "tdrop.1"
}

package() {
  cd "tdrop"
  install -Dm755 "tdrop" "${pkgdir}/usr/bin/tdrop"
  install -Dm644 "tdrop.1.gz" "${pkgdir}/usr/man/man1/tdrop.1.gz"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ft=sh ts=2 sw=2 et:
