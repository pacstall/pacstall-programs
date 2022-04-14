name="lyx"
version="2.3.6.1"
description="An advanced WYSIWYM document processor & LaTeX front-end"
depends="libqt5svg5-dev texlive-base python3 imagemagick libhunspell-dev file hicolor-icon-theme desktop-file-utils"
build_depends="bc libx11-dev qtbase5-dev libenchant-2-dev"
optdepends=("rcs: built-in version control system"
  "texlive-latex-base: float wrap support")
url="https://ftp.lip6.fr/pub/lyx/stable/2.3.x/lyx-${version}.tar.gz"
hash="6d6f5458ebaac644cdfa35114d029e9ec57b4d930268d6d40bd9795d5c7e7929"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
repology=("project: lyx")

prepare() {
  true
}

build() {
  ./configure --prefix=/usr \
    --enable-qt5 \
    --enable-build-type=release
  make -j$(nproc)
}

install() {
  sudo make install DESTDIR="${STOWDIR}/${name}"
  # install appdata
  sudo install -Dm644 ./lib/appdata.xml "${STOWDIR}/${name}/usr/share/metainfo/lyx.appdata.xml"
}
