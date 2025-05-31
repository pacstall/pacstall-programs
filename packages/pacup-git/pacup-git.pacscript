pkgname="pacup-git"
gives="pacup"
arch=("all")
pkgver="3.3.12"
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
maintainer=('Oren Klopfer <oren@taumoda.com>')

build() {
  cd "${gives}"
  perl Makefile.PL
  make -j"${NCPU}"
}

package() {
  make -C "${gives}" install DESTDIR="${pkgdir}"
}
