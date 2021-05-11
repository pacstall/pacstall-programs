name="awesomewm-git"
pkgname="${name}"
version="a4572b9"
url="https://github.com/awesomeWM/awesome.git"
description="awesome window manager"
depends="libcairo2-dev dbus libgdk-pixbuf2.0-dev libxdg-basedir-dev libxkbcommon-x11-dev lua5.3 lua-lgi-dev libpango1.0-dev libstartup-notification0-dev libxcb-cursor-dev libxcb-keysyms1-dev libxcb-util-dev libxcb-xrm-dev libxfixes-dev cmake"
build_depends="asciidoc docbook-xsl git imagemagick lua-ldoc xmlto"
optdepends=("rlwrap: readline support for awesome-client"
            "dex: autostart your desktop files"
            "librsvg2-dev: for displaying SVG files without scaling artifacts")
gives="awesome awesomewm notification-daemon"
breaks="awesome awesomewm-bin"
maintainer="wizard-28 <basak.sb2006@gmail.com>"

prepare() {
  true
}

build() {
  make -j"$(nproc)" DESTDIR=/usr/src/pacstall/"${name}"
}

install() {
  make install DESTDIR=/usr/src/pacstall/"${name}"
}
