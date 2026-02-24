pkgname="yad"
pkgver="14.2"
arch=("any")
source=("@${pkgname}~${pkgver}::https://github.com/v1cont/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
makedepends=("autotools-dev" "libgtk-3-dev" "automake" "autopoint")
depends=("libc6" "libcairo2" "libgdk-pixbuf-2.0-0 | libgdk-pixbuf2.0-0" "libglib2.0-0" "libgtk-3-0" "libpango-1.0-0" "libpangocairo-1.0-0" "libwebkit2gtk-4.1-dev | libwebkit2gtk-4.0-dev" "libgtksourceview-3.0-dev" "libgspell-1-dev")
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-app" "${pkgname}-git" "${pkgname}-deb")
pkgdesc="Yet Another Dialog"
sha256sums=("5cab399af8d9a10b76d477f848180d00addba38f4f1272a05b153a393bba3038")
maintainer=("echometerain <echometer@disroot.org>"
  "xdavius <xdavius@github.com>")
repology=("project: yad")

prepare() {
  cd "${pkgname}~${pkgver}"

  autoreconf -ivf
}

build() {
  cd "${pkgname}~${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-icon-browser \
    --enable-html \
    --enable-spell \
    --enable-sourceview

  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"

  make install DESTDIR="${pkgdir}"
}
