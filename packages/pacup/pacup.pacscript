pkgname="pacup"
pkgver="3.3.2"
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
sha256sums=('1cc57e8e3af68b59c95a7e69182a03389fa9954a73409660c0d52afc1f954abc')
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
