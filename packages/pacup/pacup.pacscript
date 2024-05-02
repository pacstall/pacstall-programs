pkgname="pacup"
pkgver="3.0.0"
pkgdesc="Help maintainers update pacscripts (next-gen Perl rewrite)"
depends=(
  'libdata-compare-perl'
  'libfile-chdir-perl'
  'libipc-system-simple-perl'
  'libjson-perl'
  'libwww-perl'
  'liblist-moreutils-perl'
  'libterm-progressbar-perl'
)
replaces=(
  "${pkgname}"
  "${pkgname}.pl"
  "${pkgname}.py"
  "${pkgname}-bin"
  "${pkgname}-git"
)
source=("https://github.com/pacstall/${pkgname}/archive/refs/tags/${pkgver}.zip")
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
  make -C "${pkgname}-${pkgver}" install DESTDIR="${pkgdir}"
}
