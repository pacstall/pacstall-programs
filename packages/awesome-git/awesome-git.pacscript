#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="awesome-git"
pkgname="awesome"
pkgdir="${STOWDIR}/${name}"
description="Highly configurable, next generation framework window manager for X"
url="https://github.com/awesomeWM/${pkgname}.git"
depends="luajit lua-lgi libcairo-gobject2 gir1.2-pango-1.0 gir1.2-glib-2.0 gir1.2-freedesktop gir1.2-gdkpixbuf-2.0 default-dbus-session-bus"
build_depends="cmake libluajit-5.1-dev lua-lgi-dev x11proto-core-dev libx11-xcb-dev libxcb-cursor-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-shape0-dev libxcb-util0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-xtest0-dev libxkbcommon-dev libxkbcommon-x11-dev libstartup-notification0-dev libcairo2-dev libpango1.0-dev libgdk-pixbuf2.0-dev imagemagick libxdg-basedir-dev menu xmlto"
optdepends=("gir1.2-gtk-3.0: for ./themes/gtk/"
            "default-dbus-session-bus: for DBus integration"
            "libdbus-1-dev: for DBus integration and the awesome-client utility"
            "asciidoctor: for generating man pages"
            "gzip: for compressing man pages"
            "rlwrap: readline support for awesome-client"
            "dex: autostart your desktop files"
            "librsvg2-dev: for displaying SVG files without scaling artifacts"
            "feh: for icon generation etc"
            "awesome-extra: additional modules for awesome"
            "awesome-doc: documentation for awesome")
breaks="${pkgname} ${pkgname}-bin"

pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
  true
}

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
  sudo ln -sf "${pkgdir}"/usr/local/share/xsessions/"${pkgname}".desktop /usr/share/xsessions/"${pkgname}".desktop
}

removescript() {
  # Remove desktop file
  sudo rm -f /usr/share/xsessions/"${pkgname}".desktop
}
# vim:set ft=sh ts=2 sw=2 et:
