pkgname="pacup"
arch=("all")
pkgver="3.4.0"
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
sha256sums=('31d1d8a67de74fd3a492350c44e53ce844052408dd709748bf53a51180ecc517')
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
