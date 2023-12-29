name="emacs"
pkgdesc="An extensible, customizable, free/libre text editor — and more."
replace="${name}-nox"
breaks=("${name}-git" "${name}-pgtk" "${name}-snapshot-deb")
pkgver="29.1"
url="https://mirrors.ocf.berkeley.edu/gnu/emacs/emacs-${pkgver}.tar.xz"
hash="d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
maintainer="wizard-28 <wiz28@pm.me>"
repology=("project: emacs")
makedepends=(
  "pkg-config"
  "libacl1-dev"
  "libalsaplayer-dev"
  "libasound2-dev"
  "libdbus-1-dev"
  "libfontconfig-dev"
  "libfreetype-dev"
  "libgccjit-13-dev"
  "libgdk-pixbuf-2.0-dev"
  "libgif-dev"
  "libglib2.0-dev"
  "libgmp3-dev"
  "libgnutls28-dev"
  "libgpm-dev"
  "libgtk-3-dev"
 	"libharfbuzz-dev"
  "libice-dev"
  "libjansson-dev"
 	"libjpeg62-turbo-dev"
  "liblcms2-dev"
  "libm17n-dev"
 	"libncurses-dev"
  "libotf-dev"
 	"libpango1.0-dev"
  "libpng-dev"
 	"librsvg2-dev"
  "libsm-dev"
  "libsqlite3-dev" "sqlite3"
  "libsystemd-dev"
 	"libtiff-dev"
 	"libtree-sitter-dev"
 	"libwebp-dev"
  "libxfixes-dev"
 	"libxml2-dev"
  "zlib1g-dev"
)

prepare() {
  local _conf=(
    "--disable-build-details"
    "--prefix=/usr"
    "--libexecdir=/usr/lib"
    "--localstatedir=/var"
    "--mandir=/usr/share/man"
    "--sysconfdir=/etc"
    "--with-cairo"
    "--with-gameuser=:games"
    "--with-harfbuzz"
    "--with-libsystemd"
    "--with-modules"
    "--with-native-compilation=aot"
    "--with-tree-sitter"
    "--with-x-toolkit=gtk3"
    "--program-transform-name=s/\([ec]tags\)/\1.emacs/"
  )

  ./configure "${_conf[@]}"
}

build() {
  make -j"${NCPU}"
  make -j"${NCPU}" html
}

package() {
  sudo make -j"${NCPU}" DESTDIR="${pkgdir}" install
  sudo make -j"${NCPU}" DESTDIR="${pkgdir}" install-html

  # fix user/root permissions on /usr/share files
  sudo chown -R root:root "${pkgdir}/usr/share/emacs"

  # fix permssions on /var/games
  sudo mkdir -p "${pkgdir}/var/games/emacs"
  sudo chmod -R 775 "${pkgdir}/var/games"
  sudo chown -R root:games "${pkgdir}/var/games"
}
# vim:set ft=sh ts=2 sw=2 et:
