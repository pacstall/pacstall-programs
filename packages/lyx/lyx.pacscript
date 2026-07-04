pkgname="lyx"
arch=("any")
pkgver="2.5.1"
pkgdesc="An advanced WYSIWYM document processor & LaTeX front-end"
depends=("libqt6svg6-dev" "texlive-base" "python3" "imagemagick" "libhunspell-dev" "file" "hicolor-icon-theme" "desktop-file-utils")
makedepends=("bc" "libx11-dev" "qt6-base-dev" "libenchant-2-dev" "libqt6svg6-dev" "pkg-config" "libxkbcommon-dev")
optdepends=("rcs: built-in version control system"
  "texlive-latex-base: float wrap support")
source=("@${pkgname}~${pkgver}::https://ftp.lip6.fr/pub/lyx/stable/2.5.x/lyx-${pkgver}.tar.xz")
sha256sums=("f2a2387bcb3f2f546c1fc13e4c74cb4f8aa648706ce5788ef705dd51344d2cfd")
maintainer=("cat-master21 <96554164+cat-master21@users.noreply.github.com>")
repology=("project: lyx")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure --prefix=/usr \
    --enable-qt6 \
    --enable-build-type=release
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
  # install metadata
  install -Dm644 ./lib/org.lyx.LyX.metainfo.xml "${pkgdir}/usr/share/metainfo/org.lyx.LyX.metainfo.xml"
}
