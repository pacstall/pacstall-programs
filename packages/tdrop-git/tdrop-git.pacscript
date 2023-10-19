maintainer="Thomas Crha <thomas@9bitbyte.com>"

name="tdrop-git"
gives="tdrop"
url="https://github.com/noctuid/tdrop.git"
pkgver="0.5.0"
homepage='https://github.com/noctuid/tdrop'
pkgdesc="A Glorified WM-Independent Dropdown Creator"
makedepends=("cmake")
depends=("xdotool", "bash", "gawk", "procps-ng")

package() {
  sudo make install
}
# vim:set ft=sh ts=2 sw=2 et:
