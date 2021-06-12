#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="awesome-git"
pkgname="awesome"
pkgdir="/usr/src/pacstall/${name}"
description="awesome window manager"
url="https://github.com/awesomeWM/${pkgname}.git"
depends="libdbus-1-dev libxcb-xfixes0-dev libxcb-randr0-dev libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-xtest0-dev liblua5.3-dev libcairo2-dev dbus libgdk-pixbuf2.0-dev libxdg-basedir-dev libxkbcommon-x11-dev lua5.3 lua-lgi-dev libpango1.0-dev libstartup-notification0-dev libxcb-cursor-dev libxcb-keysyms1-dev libxcb-util-dev libxcb-xrm-dev libxfixes-dev cmake"
build_depends="asciidoc docbook-xsl git imagemagick lua-ldoc xmlto"
optdepends=("rlwrap: readline support for awesome-client"
            "dex: autostart your desktop files"
            "librsvg2-dev: for displaying SVG files without scaling artifacts"
            "feh: for icon generation etc"
            "awesome-extra: additional modules for awesome"
            "awesome-doc: documentation for awesome")
breaks="${pkgname} ${pkgname}-bin"
removescript="yes"


pkgver() {
    git ls-remote "${url}" master  cut -f1 
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  # Build rquired files
  sudo make -j"$(nproc)" DESTDIR="${pkgdir}"
}

install() {
  # Install awesome
  sudo make install DESTDIR="${pkgdir}"
}

postinst(){
  # Install to correct location .desktop file
  sudo ln -sf "${pkgdir}"/usr/local/share/xsessions/"${pkgname}".desktop /usr/share/xsessions/"${pkgname}".desktop
}

removescript() {
  # Remove desktop file
  sudo rm -f /usr/share/xsessions/"${pkgname}".desktop
}
