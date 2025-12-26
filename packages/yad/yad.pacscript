pkgname="yad"
arch=("any")
pkgver="14.1"
source=("@${pkgname}~${pkgver}::https://github.com/v1cont/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
  "debian12.patch")
makedepends=("autotools-dev" "intltool" "libgtk-3-dev" "automake")
depends=("libc6" "libcairo2" "libgdk-pixbuf2.0-0" "libglib2.0-0" "libgtk-3-0" "libpango-1.0-0" "libpangocairo-1.0-0")
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-app" "${pkgname}-git" "${pkgname}-deb")
gives="yad"
pkgdesc="Yet Another Dialog"
sha256sums=("dde047a915cd8d3892c32b6ba031876f5cda673e01882c99613f043867c88133")
optdepends=("libwebkit2gtk-4.0-dev: for supporting HTML dialog"
  "libgtksourceview-3.0-dev: for enabling syntax highlighting in text-info dialog"
  "libgspell-1-dev: for support spell checking in text fields")
maintainer=("echometerain <echometer@disroot.org>"
  "xdavius <xdavius@github.com>")
repology=("project: yad")

prepare() {
  cd "${pkgname}~${pkgver}"
  patch -p1 < ../debian12.patch
  autoreconf -ivf && intltoolize

  FLAGS=" --enable-icon-browser"
  if dpkg-query -W libwebkit2gtk-4.0-dev > /dev/null 2>&1; then
    FLAGS+=" --enable-html"
  fi
  if dpkg-query -W libgspell-1-dev > /dev/null 2>&1; then
    FLAGS+=" --enable-spell"
  fi
  if dpkg-query -W libgtksourceview-4-dev > /dev/null 2>&1; then
    FLAGS+=" --enable-sourceview"
  fi
}

build() {
  cd "${pkgname}~${pkgver}"
  ./configure "${FLAGS}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

post_install() {
  sudo "/usr/bin/glib-compile-schemas" "/usr/local/share/glib-2.0/schemas"
  gtk-update-icon-cache
}
