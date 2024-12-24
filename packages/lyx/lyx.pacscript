pkgname="lyx"
arch=("any")
pkgver="2.3.7-1"
pkgdesc="An advanced WYSIWYM document processor & LaTeX front-end"
depends=("libqt5svg5-dev" "texlive-base" "python3" "imagemagick" "libhunspell-dev" "file" "hicolor-icon-theme" "desktop-file-utils")
makedepends=("bc" "libx11-dev" "qtbase5-dev" "libenchant-2-dev" "libqt5svg5-dev" "pkg-config")
optdepends=("rcs: built-in version control system"
  "texlive-latex-base: float wrap support")
source=("@${pkgname}~${pkgver}::https://ftp.lip6.fr/pub/lyx/stable/2.3.x/lyx-${pkgver}.tar.gz")
sha256sums=("910bb48d9b19c0cfeb6ec845eb318515f33a63ea7892a99b2e7b67c6b518bacd")
maintainer=("cat-master21 <96554164+cat-master21@users.noreply.github.com>")
repology=("project: lyx")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure --prefix=/usr \
    --enable-qt5 \
    --enable-build-type=release
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
  # install appdata
  install -Dm644 ./lib/appdata.xml "${pkgdir}/usr/share/metainfo/lyx.appdata.xml"
}
