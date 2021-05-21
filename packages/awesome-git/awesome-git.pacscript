#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="awesome-git"
pkgname="${name}"
version="9c5149d"
url="https://github.com/awesomeWM/awesome.git"
description="awesome window manager"
depends="libdbus-1-dev libxcb-xfixes0-dev libxcb-randr0-dev libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-xtest0-dev liblua5.3-dev libcairo2-dev dbus libgdk-pixbuf2.0-dev libxdg-basedir-dev libxkbcommon-x11-dev lua5.3 lua-lgi-dev libpango1.0-dev libstartup-notification0-dev libxcb-cursor-dev libxcb-keysyms1-dev libxcb-util-dev libxcb-xrm-dev libxfixes-dev cmake"
build_depends="asciidoc docbook-xsl git imagemagick lua-ldoc xmlto"
optdepends=("rlwrap: readline support for awesome-client"
            "dex: autostart your desktop files"
            "librsvg2-dev: for displaying SVG files without scaling artifacts"
            "feh: for icon generation etc"
            "awesome-extra: additional modules for awesome"
            "awesome-doc: documentation for awesome")
gives="awesome awesomewm notification-daemon"
breaks="awesome awesomewm-bin"
removescript="yes"

prepare() {
  true
}

build() {
  make -j"$(nproc)" DESTDIR=/usr/src/pacstall/"${name}"
}

install() {
  make install DESTDIR=/usr/src/pacstall/"${name}"
}

postinst(){
  ln -sf /usr/src/pacstall/"${name}"/usr/local/share/xsessions/awesome.desktop /usr/share/xsessions/awesome.desktop
}

removescript() {
  rm -f /usr/share/xsessions/awesome.desktop
}
