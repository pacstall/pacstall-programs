pkgname="pacup"
pkgver="3.3.4"
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
sha256sums=('b9657bb05f0d4ac7e2e2425b0cdc2a3dd8da55f1c3a10b551b4a888c75e24087')
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
