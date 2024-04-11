name="pacup.pl-git"
gives="pacup.pl"
pkgver="20240404"
pkgdesc="Next-gen rewrite of Pacup"
depends=(
  'libdata-compare-perl'
  'libfile-chdir-perl'
  'libipc-system-simple-perl'
  'libjson-perl'
  'libwww-perl'
)
url="https://github.com/vigress8/pacup.pl.git"
maintainer="vigress8 <vig@disroot.org>"

package() {
  sudo install -Dm755 pacup.pl -t "${pkgdir}/usr/bin"
}
