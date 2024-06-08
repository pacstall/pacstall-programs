pkgname="pacup-git"
gives="pacup"
pkgver="3.2.0"
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
  "${gives}"
  "${gives}.pl"
  "${gives}.py"
  "${gives}-bin"
  "${gives}-git"
)
source=("https://github.com/pacstall/${gives}.git")
maintainer=(
  'vigress8 <vig@disroot.org>'
  'Oren Klopfer <oren@taumoda.com>'
)

build() {
  cd "${gives}"
  perl Makefile.PL
  make -j"${NCPU}"
}

package() {
  make -C "${gives}" install DESTDIR="${pkgdir}"
}
