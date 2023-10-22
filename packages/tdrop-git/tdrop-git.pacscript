maintainer="Thomas Crha <thomas@9bitbyte.com>"

name="tdrop-git"
gives="tdrop"
url="https://github.com/noctuid/tdrop.git"
pkgver="0.5.0"
homepage='https://github.com/noctuid/tdrop'
pkgdesc="A Glorified WM-Independent Dropdown Creator"
makedepends=("cmake")
depends=("xdotool" "bash" "gawk" "procps-ng")

package() {
  sudo install -Dm755 "tdrop" "/usr/local/bin/tdrop"
  sudo install -Dm644 "tdrop.1" "/usr/local/share/man/man1/tdrop.1"
  sudo install -Dm644 "LICENSE" "/usr/local/share/licenses/tdrop/LICENSE"
}
# vim:set ft=sh ts=2 sw=2 et:
