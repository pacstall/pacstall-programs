# based on the Arch Linux PKGBUILD (https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gnucash-git)
pkgname="gnucash"
pkgver="5.15"
pkgdesc="Personal and small-business financial-accounting application"
url='http://www.gnucash.org'
repology=("project: ${pkgname}")
arch=('any')
source=(
  "https://github.com/Gnucash/gnucash/releases/download/${pkgver}/gnucash-${pkgver}.tar.gz"
)
sha256sums=(
  "66e77d585bac9fb53c935fa448ac6305bdb28f8f366a3ecddacb8310121bb028"
)
maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")
license=("GPL-2.0-or-later")
depends=('libaqbanking44' 'guile-3.0>=2.0.9' 'libwebkit2gtk-4.1-0' 'libxml2')
optdepends=('evince: for print preview'
  'libdate-manip-perl: for stock information lookups'
  'libfinance-quote-perl: for stock information lookups')
# Taken from `README.dependencies`
makedepends=(
  'git'
  'cmake'
  'swig>=3.0.12'
  'pkg-config'
  'libwebkit2gtk-4.1-dev>=2.14.1'
  'libxml2-dev>=2.9.4'
  'libxslt-dev'
  'libaqbanking-dev>=6.4.0'
  'libboost-all-dev>=1.67.0'
  'guile-3.0-dev>=2.0.9'
  'libgwengui-gtk3-dev>=5.8.0'
  'libofx-dev>=0.9.12'
  'xsltproc'
  'libdbi-dev>=0.8.3'
  'libdbd-mysql'
  'libgtest-dev>=1.8.0'
)

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
