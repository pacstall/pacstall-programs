# based on the Arch Linux PKGBUILD (https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gnucash-git)
pkgname="gnucash"
pkgver="5.11"
pkgdesc="Personal and small-business financial-accounting application"
url='http://www.gnucash.org'
repology=("project: ${pkgname}")
arch=('amd64') # can also be build for 'i386' 'ppc64el', but not tested
source=(
  "https://github.com/Gnucash/gnucash/releases/download/${pkgver}/gnucash-${pkgver}.tar.gz"
)
sha256sums=(
  "a5d3a12991cff287267f6896d70bd8b3fe7030fb552b1d18067300d0ed7f8a2f"
)

maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")
license=("GPL-2.0-or-later")
depends=('libaqbanking44' 'guile-3.0' 'libwebkit2gtk-4.1-0' 'libxml2')
optdepends=('evince: for print preview'
  'libdate-manip-perl: for stock information lookups'
  'libfinance-quote-perl: for stock information lookups')
makedepends=('git' 'cmake' 'swig' 'pkg-config' 'libwebkit2gtk-4.1-dev' 'libxml2-dev' 'libxslt-dev' 'libaqbanking-dev' 'libboost-all-dev' 'guile-3.0-dev' 'libgwengui-gtk3-dev' 'libofx-dev' 'xsltproc' 'libdbi-dev' 'libdbd-mysql' 'libgtest-dev')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DHAVE_GWEN_GTK3=ON \
    -DCOMPILE_GSCHEMAS=OFF \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make VERBOSE=0 -j"${NCPU}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}/usr/bin/gnucash-valgrind"
}
