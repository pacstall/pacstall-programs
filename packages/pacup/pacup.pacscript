pkgname="pacup"
pkgver="3.3.3"
pkgdesc="Help maintainers update pacscripts (next-gen Perl rewrite)"
depends=(
  'libdata-compare-perl'
  'libfile-chdir-perl'
  'libipc-system-simple-perl'
  'libjson-perl'
  'liblist-moreutils-perl'
  'libterm-progressbar-perl'
  'libwww-perl'
)
replaces=(
  "${pkgname}"
  "${pkgname}.pl"
  "${pkgname}.py"
  "${pkgname}-bin"
  "${pkgname}-git"
)
source=("https://github.com/pacstall/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('811f65b0d64da711db63231d54623fd5c71495eb2e2553587a7c584c31476901')
maintainer=(
  'vigress8 <vig@disroot.org>'
  'Oren Klopfer <oren@taumoda.com>'
)

build() {
  cd "${pkgname}-${pkgver}"
  perl Makefile.PL
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
