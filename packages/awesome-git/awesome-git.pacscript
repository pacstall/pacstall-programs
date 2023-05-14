#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="awesome-git"
pkgname="awesome"
description="awesome window manager"
url="https://github.com/awesomeWM/${pkgname}.git"
depends=("libx11-6" "libxcb-cursor0" "libxcb-icccm4" "libxcb-keysyms1" "libxcb-randr0" "libxcb-shape0" "libxcb-util1" "libxcb-xinerama0" "libxcb-xkb1" "libxcb-xrm0" "libxcb-xtest0" "libxcb1" "libxdg-basedir1" "libxkbcommon-x11-0" "libxkbcommon0" "libstartup-notification0" "libglib2.0-0" "libgdk-pixbuf2.0-0" "libgdk-pixbuf-2.0-0" "libdbus-1-3" "libcairo2" "libcairo-gobject2" "gir1.2-glib-2.0" "gir1.2-gdkpixbuf-2.0" "gir1.2-freedesktop" "lua5.3" "liblua5.3-0" "dbus-x11" "libnotify-bin" "wmctrl" "x11-apps" "xcb-proto" "xdotool" "xorg" "lua-lgi")
build_depends=("asciidoctor" "gir1.2-pango-1.0" "gir1.2-gtk-3.0" "git" "gzip" "lua-ldoc" "imagemagick" "asciidoc" "xmlto" "cmake" "lua-busted" "lua-check" "liblua5.3-dev" "libxcb-cursor-dev" "libxcb-util0-dev" "libxcb-keysyms1-dev" "libxcb-icccm4-dev" "libxcb-xkb-dev" "libxkbcommon-dev" "libstartup-notification0-dev" "libxdg-basedir-dev" "libxcb-xrm-dev" "libxkbcommon-x11-dev" "lua-lgi" "libglib2.0-dev" "libgdk-pixbuf2.0-dev" "libxcb-xinerama0-dev" "gettext" "libdbus-1-dev" "libgirepository1.0-dev" "libpango1.0-dev" "libx11-xcb-dev" "libxcb-randr0-dev" "libxcb-shape0-dev" "libxcb-xfixes0-dev" "xutils-dev" "libluajit-5.1-dev" "libcairo2-dev" "lua-discount" "x11proto-dev" "libxcb-xtest0-dev" "libmarkdown2" "libyaml-dev" "lua-any" "lua-cliargs" "lua-dkjson" "lua-filesystem" "lua-inifile" "lua-luassert" "lua-mediator" "lua-penlight" "lua-say" "lua-system" "lua-term" "lua5.2" "libc6" "luajit")
optdepends=("rlwrap: readline support for awesome-client"
  "dex: autostart your desktop files"
  "librsvg2-dev: for displaying SVG files without scaling artifacts"
  "feh: for icon generation etc"
  "awesome-extra: additional modules for awesome"
  "awesome-doc: documentation for awesome")
breaks=("${pkgname}" "${pkgname}-bin")

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

build() {
  # Build rquired files
  make -j"$(nproc)" DESTDIR="${pkgdir}"
}

install() {
  # Install awesome
  sudo make install DESTDIR="${pkgdir}"
}

postinst() {
  # Install to correct location .desktop file
  sudo mkdir -p /usr/share/xsessions/
  sudo ln -sf /usr/local/share/xsessions/"${pkgname}".desktop /usr/share/xsessions/"${pkgname}".desktop
}

removescript() {
  # Remove desktop file
  sudo rm -f /usr/share/xsessions/"${pkgname}".desktop
}
# vim:set ft=sh ts=2 sw=2 et:
