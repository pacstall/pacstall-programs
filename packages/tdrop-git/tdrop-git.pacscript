pkgname="tdrop-git"
gives="tdrop"
source=("https://github.com/noctuid/tdrop.git")
pkgver="1.5.0"
url="https://github.com/noctuid/tdrop"
pkgdesc="A Glorified WM-Independent Dropdown Creator"
maintainer=("Thomas Crha <thomas@9bitbyte.com>")
depends=("xdotool" "bash" "gawk" "procps")

prepare() {
  cd "${_archive}"
  gzip -9n "tdrop.1"
}

package() {
  cd "${_archive}"
  install -Dm755 "tdrop" "/usr/local/bin/tdrop"
  install -Dm644 "tdrop.1.gz" "/usr/local/share/man/man1/tdrop.1.gz"
  install -Dm644 "LICENSE" "/usr/local/share/licenses/tdrop/LICENSE"
}
# vim:set ft=sh ts=2 sw=2 et:
