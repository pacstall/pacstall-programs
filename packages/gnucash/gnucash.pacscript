# based on the Arch Linux PKGBUILD (https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gnucash-git)
pkgname="gnucash"
gives="gnucash"
pkgver="5.10"
pkgdesc="A personal and small-business financial-accounting application - GIT version using release tags"
url="http://www.gnucash.org"
repology=("project: ${pkgname}")
arch=('amd64') # can also be build for 'i386' 'ppc64el', but not tested
source=(
  "https://github.com/Gnucash/gnucash/releases/download/${pkgver}/gnucash-${pkgver}.tar.gz"
)
sha256sums=(
  "7370fa0f56b574ff459745b6154ca02076e4f2ef97d2907c8721605225b80524"
)

maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")
license=("GPL-2.0-or-later")
# It is highly likely that some of the (make)dependencies are not needed, if anyone wants to check each one, be my guest lol...
depends=('libaqbanking44' 'libaqbanking-dev' 'libboost-all-dev' 'guile-3.0' 'libdbi1t64' 'libwebkit2gtk-4.1-0' 'libofx7t64' 'libgwengui-gtk3-79t64' 'libxml2')
optdepends=('evince: for print preview'
  'libdate-manip-perl: for stock information lookups'
  'libfinance-quote-perl: for stock information lookups')
makedepends=('git' 'libboost-all-dev' 'cmake' 'swig' 'libgtest-dev' 'guile-3.0-dev' 'libmariadb-dev' 'libpq-dev' 'libwebkit2gtk-4.1-dev' 'libgwenhywfar-core-dev' 'libaqbanking-dev' 'libgwengui-gtk3-dev' 'libofx-dev' 'libdbi-dev' 'libdbd-mysql' 'libxslt-dev' 'xsltproc' 'libxml2-dev')

pkgver() {
  cd "${srcdir}"/"${gives}-${pkgver}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
      || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}"/"${gives}-${pkgver}"

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DHAVE_GWEN_GTK3=ON \
    -DCOMPILE_GSCHEMAS=OFF \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make VERBOSE=0
}

package() {

  cd "${srcdir}"/"${gives}-${pkgver}"/"build"

  make DESTDIR="${pkgdir}" install

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind
}
