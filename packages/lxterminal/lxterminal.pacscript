pkgname="lxterminal"
pkgver="0.4.1"
provides=("x-terminal-emulator")
arch=("amd64")
url='https://www.lxde.org/'
license=("GPL-2.0-only")
pkgdesc="VTE terminal emulator written in GTK"
depends=(
  "libgdk-pixbuf-2.0-0>=2.22.0"
  "libglib2.0-0>=2.28.0"
  "libgtk-3-0>=3.21.5"
  "libpango-1.0-0>=1.14.0"
  "libvte-2.91-0>=0.51.90"
  "libx11-6"
)
makedepends=(
  "autotools-dev"
  "docbook-xml"
  "docbook-xsl"
  "intltool"
  "libglib2.0-dev"
  "libgtk2.0-dev"
  "libvte-2.91-dev"
  "libxml2-utils"
  "xsltproc"
)
source=("@${pkgname}~${pkgver}::https://github.com/lxde/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("d5da0646e20ad2be44ef69a9d620be5f1ec43b156dc585ebe203dd7b05c31d88")
maintainer=("Don Alfons <donnisnoni@outlook.com>")

prepare() {
  cd "${pkgname}~${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-gtk3 --enable-man
}

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

check() {
  cd "${pkgname}~${pkgver}"
  make -j1 check
}

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install
}

post_install() {
  update-alternatives --install /usr/bin/x-terminal-emulator \
    x-terminal-emulator /usr/bin/lxterminal 20 \
    --slave /usr/share/man/man1/x-terminal-emulator.1.gz \
    x-terminal-emulator.1.gz /usr/share/man/man1/lxterminal.1.gz
}

post_remove() {
  update-alternatives --remove x-terminal-emulator /usr/bin/lxterminal
}
