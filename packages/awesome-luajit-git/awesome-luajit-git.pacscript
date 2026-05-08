# Base script was made "wizard-28 <wiz28@pm.me>" awesome-git and the AUR.

pkgname="awesome-luajit-git"
gives="awesome"
pkgdesc="awesome window manager built with luajit"
source=("https://github.com/awesomeWM/${gives}.git")
arch=("any")
pkgver="4.3"
maintainer=("aKqir24 <aKqir24@github.com>")
depends=(
  "libcairo2" "libcairo-gobject2" "libdbus-1-3" "dbus-x11"
  "libgdk-pixbuf-2.0-0" "libxdg-basedir1" "libxkbcommon-x11-0"
  "libxkbcommon0" "lua-lgi" "libpango-1.0-0"
  "libstartup-notification0" "libxcb-cursor0" "libxcb-keysyms1"
  "libxcb-icccm4" "libxcb-xrm0" "libxcb-util1" "libxcb1"
  "libxcb-randr0" "libxcb-shape0" "libxcb-xinerama0"
  "libxcb-xkb1" "libxcb-xtest0" "libxcb-xfixes0" "libx11-6"
  "gir1.2-pango-1.0" "gir1.2-glib-2.0" "gir1.2-gdkpixbuf-2.0"
  "gir1.2-freedesktop" "wmctrl"
)

# Build dependencies
makedepends=(
  "cmake" "pkg-config" "libglib2.0-dev"
  "asciidoctor" "imagemagick" "gzip" "luajit"
  "lua-lgi" "lua-ldoc" "lua-busted" "lua-check"
  "libcairo2-dev" "libdbus-1-dev" "libgdk-pixbuf-2.0-dev"
  "libxdg-basedir-dev" "libxkbcommon-x11-dev" "libpango1.0-dev"
  "libstartup-notification0-dev" "libgirepository1.0-dev"
  "libx11-xcb-dev" "libxcb-cursor-dev" "libxcb-keysyms1-dev"
  "libxcb-icccm4-dev" "libxcb-xrm-dev" "libxcb-util0-dev" "libluajit-5.1-dev"
  "libxcb-randr0-dev" "libxcb-shape0-dev" "libxcb-xinerama0-dev"
  "libxcb-xkb-dev" "libxcb-xtest0-dev" "libxcb-xfixes0-dev" "x11proto-dev"
  "librsvg2-dev" "librsvg2-common" "gir1.2-rsvg-2.0"
)
optdepends=("rlwrap: readline support for awesome-client"
  "dex: autostart your desktop files"
  "librsvg2-dev: for displaying SVG files without scaling artifacts"
  "feh: for icon generation etc"
  "awesome-extra: additional modules for awesome"
  "awesome-doc: documentation for awesome")
breaks=("${gives}" "${gives}-bin")
replaces=("${gives}" "${gives}-bin" "${gives-doc}")
conflicts=("${gives-doc}")

build() {
  cd "${gives}"
  mkdir build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc \
    -DLUA_EXECUTABLE=/usr/bin/luajit \
    -DLUA_INCLUDE_DIR=/usr/include/luajit-2.1 \
    -DLUA_LIBRARY=/usr/lib/x86_64-linux-gnu/libluajit-5.1.so \
    -DLUA_LIBRARIES=/usr/lib/x86_64-linux-gnu/libluajit-5.1.so \
    -DGENERATE_DOC=OFF \
    -DGENERATE_MANPAGES=OFF

  make -j"${NCPU}" DESTDIR="${pkgdir}"
}

package() {
  cd "${gives}/build"

  make install DESTDIR="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/xsessions"
  ln -sf /usr/share/xsessions/"${gives}".desktop "${pkgdir}/usr/share/xsessions/${gives}.desktop"
}

# vim:set ft=sh ts=2 sw=2 et:
