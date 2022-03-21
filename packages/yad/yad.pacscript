name="yad"
version="11.0"
url="https://github.com/v1cont/yad/archive/refs/tags/v${version}.tar.gz"
build_depends="autotools-dev intltool libgtk-3-dev"
depends="libc6 libcairo2 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libpango-1.0-0 libpangocairo-1.0-0"
breaks="${name} ${name}-bin ${name}-app ${name}-git ${name}-deb"
gives="yad"
description="Yet Another Dialog"
hash="af20b5a7120ba303ca8845db62c9a7410ae5b5224a3eb3563cd70774a745b9f2"
optdepends=("libwebkit2gtk-4.0-dev: for supporting HTML dialog"
  "libgtksourceview-4-dev: for enabling syntax highlighting in text-info dialog"
  "libgspell-1-dev: for support spell checking in text fields")
maintainer="echometerain <echometer@disroot.org>"
repology=("project: yad")

prepare() {
  autoreconf -ivf
  intltoolize

  FLAGS="--enable-icon-browser --enable-gio"
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
  ./configure " ${FLAGS}"
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${STOWDIR}/${name}"
}

postinst() {
  gtk-update-icon-cache
}
