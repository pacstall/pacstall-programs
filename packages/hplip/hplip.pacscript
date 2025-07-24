pkgname=hplip
pkgver=3.24.4
_archpkgrel=3
pkgdesc="Drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet"
arch=('amd64')
url='https://developers.hp.com/hp-linux-imaging-and-printing'
license=('GPL-2.0-or-later'
  'MIT'
  'IJG'
  'GPL-2.0-only'
  'LGPL-2.1-or-later'
  'BSD-2-Clause')
depends=('python3-dbus'
  'python3-distro'
  'ghostscript'
  'libsnmp-base'
  'foomatic-db-engine'
  'python3-gi-cairo'
  'libjpeg62-turbo | libjpeg-turbo8'
  'dbus'
  'libavahi-core7'
  'python3'
  'xdg-utils'
  'zlib1g'
  'libcups2 | libcups2t64'
  'libsane1'
  'libglib2.0-0 | libglib2.0-0t64')
makedepends=('python3-pyqt5'
  'python3-dev'
  'rpcbind'
  'autoconf'
  'libusb-1.0-0-dev'
  'libcups2-dev'
  'libsane-dev'
  'libjpeg62-turbo-dev | libjpeg-turbo8-dev'
  'python3-setuptools'
  'libsnmp-dev'
  'libltdl-dev'
  'libavahi-core-dev'
  'libavahi-client-dev')
optdepends=('python3-pillow: for commandline scanning support'
  'python3-reportlab: for pdf output in hp-scan'
  'rpcbind: for network support'
  'python3-pyqt5: for running GUI and hp-toolbox'
  'libusb-1.0-0: for advanced usb support'
  'wget: for network support')

_patchurl="https://gitlab.archlinux.org/archlinux/packaging/packages/hplip/-/raw/1-${pkgver}-${_archpkgrel}"
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "${_patchurl}/disable_upgrade.patch"
  "${_patchurl}/0003-models.dat-Re-add-drivers-missing-from-3.19.1.patch"
  "${_patchurl}/0018-Allow-non-JPEG-scanning-on-the-HP-DeskJet-3520-All-i.patch"
  "${_patchurl}/0022-Add-include-cups-ppd.h-in-various-places-as-CUPS-2.2.patch"
  "${_patchurl}/0023-Fix-handling-of-unicode-filenames-in-sixext.py.patch"
  # use the one from Fedora
  "${_patchurl}/hplip-configure-python.patch"
  "${_patchurl}/python3.diff"
  "${_patchurl}/reproducible-gzip.patch"
  "${_patchurl}/hplip-1_3_23_12-4-python3_12-fix.patch"
  "${_patchurl}/hplip-locale-format.patch"
  "${_patchurl}/hplip-hpaio-gcc14.patch"
  "${_patchurl}/hplip-pserror-gcc14.patch")
sha512sums=('6162ec58289433659ed4c3a254b2a50863c01acb87a8c0e1a1f935fed2b1916c5ae211c2d84130f40963368ff53e0c8da1878a1fce4dd08bd517f65bbcf6a2d2'
  'a12aaeece5285ffb86bdbc24871bf512fbc1f29da44ae51ded314378032662074a42b8aca23bebb378bf78ed15bb7f99da59bfb4cd456f3458e7a5ef42a900f8'
  'f79b3f09d022178099f38b9eae1792396e730eb5352a03d088e6610d92b3895f3f65bb92089ce7f5b21d794f9716ceb176d29ca7283e8a48bb04cf6aba305a2f'
  '93e29a9ef893636b2b84443e75525c4ed42531d6e68a182dfbb725c3919c77b966b5e7d9381a34d3b5853423995a7b15efb69ce3e500ec72b25b65b2ad6bd64c'
  '22aeb5b851f78bc6bc62e0bc3da99fecaf42d7604af41e2f3343f8d3666541f7b06b7d1a7d0ddf24f1731ac7b12dfe582375a98e3b94dfa323d6ce954549ca67'
  '763949a0bc460dcc9faefc86f2a91cf342781bfce696ed0c3826758572dd03ac266bbeb7b6a4f9376ac298d7d3c9c4def42d94921a8e1d1695e39396e36d95ff'
  '089c102357ea5fd55d81ae76aaff62713f780fd84500c3b92ecd6b2bb11ccdc3a162978548e9a5f9e98a8354a5be3997e416c52daa18eda4621ed79a29d6fea8'
  'b8a4c860e90a52ec566ca5a9c7f3a5ecb7386ae76e17b2c6c878073e60eeaf0cb63883b740b4725794be9914e1ab8fc91313efb288395f3095f599c07f54cf14'
  '379fcbe9dc2986da828a174a0ac4e71a1da43a98408894d5e713e09d7d9cba1e9fac30f9602b81d48d992abe6b65b6402b8a07664efe97400c5d839be33cf15f'
  'd8c9918a5559fb4cc968607aae9c2b67814240f4d81f703a15e1a23cca0bedd21b3c79c29363bd361f8b4bed169336d2a9e152eb8ca6309bd725dc2aa6a24509'
  '321f622c070aee8d4a0a4b2ce1ae81f40ca10959f5707f57f9b2bdfdbeba953792b051470ec2477a747074e123935bb96a2d185f935670127e070466de26eb6d'
  '1da56de340104a82747607d33d6aa336fbcca8fa6de25ae244bf52cd64920334bcacf50e3f7b9ddbec1126f322325ce847763b02ff0dae44942fd24478ed466f'
  '63b0ffed2628915f4577932dfdd27a214edfbcf78745eab09cacafe0fa6ed99cdc742a97ac08ce600d202f824a0af790166e25e346f9a51d37c02747e262d742')

# validpgpkeys=('4ABA2F66DBD5A95894910E0673D770CDA59047B9') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>

maintainer=("xdavius <xdavius@github.com>")
repology=("project: ${pkgname}")

prepare() {
  cd "${pkgname}"-"${pkgver}"

  # disable insecure update - https://bugs.archlinux.org/task/38083
  patch -Np0 -i "${srcdir}"/disable_upgrade.patch
  # add missing 'include <cups/ppd.h>' at various places
  patch -Np1 -i "${srcdir}"/0022-Add-include-cups-ppd.h-in-various-places-as-CUPS-2.2.patch
  # fix some handling unicode file names FS#58412
  patch -Np1 -i "${srcdir}"/0023-Fix-handling-of-unicode-filenames-in-sixext.py.patch
  # Workaround patch for missing Python3 transition of the old
  # (pre-USB-storage) photo memory card support (pcardext) - Debian patch
  patch -Np1 -i "${srcdir}"/python3.diff
  # fix model support / Debian patch / FS#74942
  patch -Np1 -i "${srcdir}"/0003-models.dat-Re-add-drivers-missing-from-3.19.1.patch
  # https://bugs.launchpad.net/hplip/+bug/1879445
  # broken scanning - https://bugs.archlinux.org/task/66704
  patch -Np1 -i ../hplip-configure-python.patch
  #  allow non-jpeg scanning on all-in-one devices - FS#78135
  patch -Np1 -i ../0018-Allow-non-JPEG-scanning-on-the-HP-DeskJet-3520-All-i.patch
  # hp-firmware: module 'locale' not longer provides method 'format', causing traceback #4
  patch -Np1 -i ../hplip-locale-format.patch

  # make gzip creation reproducible by removing the timestamp
  patch -Np1 -i ../reproducible-gzip.patch

  # https://gitlab.archlinux.org/archlinux/packaging/packages/hplip/-/issues/3
  # patch -Np1 -i ../hplip-1_3_23_12-4-python3_12-fix.patch

  # fix build with gcc14
  patch -Np1 -i ../hplip-hpaio-gcc14.patch
  patch -Np1 -i ../hplip-pserror-gcc14.patch

  export AUTOMAKE='automake --foreign'
  autoreconf --force --install
}

build() {
  cd "${pkgname}"-"${pkgver}"
  export CFLAGS+=" -Wno-deprecated-declarations -Wno-implicit-function-declaration -Wno-return-mismatch"
  ./configure --prefix=/usr \
    --enable-qt5 \
    --disable-qt4 \
    --enable-hpcups-install \
    --enable-cups-drv-install \
    --disable-imageProcessor-build \
    --enable-pp-build #--help
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}"-"${pkgver}"
  make -j"${NCPU}" rulesdir=/usr/lib/udev/rules.d DESTDIR="${pkgdir}/" install

  # remove config provided by sane and autostart of hp-daemon
  rm -rf "${pkgdir}"/etc/{sane.d,xdg}
  install -dm755 "${pkgdir}"/etc/sane.d/dll.d
  echo hpaio > "${pkgdir}"/etc/sane.d/dll.d/hpaio

  # remove HAL .fdi file because HAL is no longer used
  rm -vrf "${pkgdir}"/usr/share/hal

  # remove rc script
  rm -vrf "${pkgdir}"/etc/init.d

  # add mixed license file
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 COPYING

  # Compile Python bytecode:
  python3 -m compileall -d /usr/share "${pkgdir}/usr/share"
  python3 -O -m compileall -d /usr/share "${pkgdir}/usr/share"
}
