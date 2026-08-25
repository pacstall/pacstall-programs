# Script is based on unit73e <unit73e@gmail.com>

pkgname="cnijfilter2"
pkgver="6.81"
pkgdesc="Canon IJ Printer Driver for Linux"
arch=('i686' 'x86_64')
url='https://www.canon.com.au/home-printers'
license=('GPL-2.0-only' 'custom:canon')
depends=('cups' 'libxml2 | libxml2-16' 'ghostscript')
makedepends=('automake' 'autoconf' 'build-essential' 'libusb-1.0-0-dev' 'libtool-bin' 'libglib2.0-dev' 'libcups2-dev' 'libxml2-dev' 'pkg-config')
provides=('tocanonij' 'tocnpwg' 'cnijlgmon3')
breaks=('cnijfilter' 'cnijfilter-mg3600')
maintainer=("aKqir24 <aKqir24@github.com>")
source=("https://gdlp01.c-wss.com/gds/4/0100012534/01/${pkgname}-source-${pkgver}-1.tar.gz"
  'add-missing-import.patch::https://aur.archlinux.org/cgit/aur.git/plain/add-missing-import.patch?h=cnijfilter2'
  'fix-libxml2-config.patch::https://aur.archlinux.org/cgit/aur.git/plain/fix-libxml2-config.patch?h=cnijfilter2'
  'gcc15-fix.patch::https://aur.archlinux.org/cgit/aur.git/plain/gcc15-fix.patch?h=cnijfilter2')
sha256sums=('a75716fc9b2823ed61bda09bd720e188f0cb309c012e975a89815738ae71bb1b'
  'a1f2ebcfa0c5c6e0d680480bd349ff4b8e4315d031315819ff92a1c11e3d2281'
  '25ab9319e30b221a2095733d0d8b576931cf5e320a47ea57dec1b1b5be1548f2'
  '268dfd75e58f6849655c0de54580e494c630e517fb9dd3a9a023ea3253640c9b')

prepare() {
  cd "${pkgname}-source-${pkgver}-1"

  sed -i '1i #include <stdbool.h>' lgmon3/src/common/libcnnet2_type.h
  sed -e '/GET_PROTOCOL/ s:^int:extern &:g' -i 'lgmon3/src/cnijlgmon3.c'
  patch -Np1 -i "../add-missing-import.patch"
  patch -Np1 -i "../fix-libxml2-config.patch"
  patch -Np1 -i "../gcc15-fix.patch"

  export LDFLAGS="-L../../com/libs_bin_${AARCH}"

  (cd cmdtocanonij2 && ./autogen.sh --prefix=/usr --datadir=/usr/share)
  (cd cmdtocanonij3 && ./autogen.sh --prefix=/usr --datadir=/usr/share)
  (cd cnijbe2 && ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin)
  (cd lgmon3 && ./autogen.sh --prefix=/usr --datadir=/usr/share --enable-libpath=/usr/lib/bjlib2 --enable-progpath=/usr/bin)
  (cd rastertocanonij && ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin)
  (cd tocanonij && ./autogen.sh --prefix=/usr)
  (cd tocnpwg && ./autogen.sh --prefix=/usr)
}

build() {
  cd "${pkgname}-source-${pkgver}-1"

  for dir in cmdtocanonij2 cmdtocanonij3 cnijbe2 lgmon3 rastertocanonij tocanonij tocnpwg; do
    make -C "${dir}" -j"${NCPU}"
  done
}

check() {
  cd "${pkgname}-source-${pkgver}-1"
  for dir in cmdtocanonij2 cmdtocanonij3 cnijbe2 lgmon3 rastertocanonij tocanonij tocnpwg; do
    make -C "${dir}" check
  done
}

package() {
  mkdir -p "${pkgdir}"/usr/{lib/bjlib2,bin,share/cups/model,lib/cups/{filter,backend}}

  cd "${pkgname}-source-${pkgver}-1"
  install -m644 "com/ini/cnnet.ini" "${pkgdir}/usr/lib/bjlib2"
  install -sm755 "com/libs_bin_${CARCH}"/*.so* "${pkgdir}/usr/lib"
  install -Dm644 "doc/LICENSE-cnijfilter-${pkgver}EN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 ppd/*.ppd "${pkgdir}/usr/share/cups/model"

  for dir in cmdtocanonij2 cmdtocanonij3 cnijbe2 lgmon3 rastertocanonij tocanonij tocnpwg; do
    make -C "${dir}" DESTDIR="${pkgdir}" install
  done
}
