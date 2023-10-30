name="yad-git"
pkgver="13.0"
url="https://github.com/v1cont/${name}/releases/download/v${pkgver}/${name}-${pkgver}.tar.xz"
makedepends=("autotools-dev" "intltool" "libgtk-3-dev" "automake")
depends=("libc6" "libcairo2" "libgdk-pixbuf2.0-0" "libglib2.0-0" "libgtk-3-0" "libpango-1.0-0" "libpangocairo-1.0-0")
breaks="${name} ${name}-bin ${name}-app ${name}-git ${name}-deb"
gives="yad"
pkgdesc="Yet Another Dialog"
hash="194198c4a58e20ceffd9a3206633c3726d962d7d4219edb77aeb748897403e34"
optdepends=("libwebkit2gtk-4.0-dev: for supporting HTML dialog"
  "libgtksourceview-3.0-dev: for enabling syntax highlighting in text-info dialog"
  "libgspell-1-dev: for support spell checking in text fields")
maintainer="echometerain <echometer@disroot.org>"
repology=("project: yad")

prepare() {
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
  ./configure "${FLAGS}"
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}

post_install() {
  sudo "/usr/bin/glib-compile-schemas" "/usr/local/share/glib-2.0/schemas"
  gtk-update-icon-cache
}
