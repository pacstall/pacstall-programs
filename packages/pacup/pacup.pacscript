pkgname="pacup"
arch=("all")
pkgver="3.3.12"
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
sha256sums=('0caac4d9d5083fefae1a55fae148a4acf974ec6a7e3b07cf8912978a909393fb')
maintainer=('Oren Klopfer <oren@taumoda.com>')

build() {
  cd "${pkgname}-${pkgver}"
  perl Makefile.PL
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
