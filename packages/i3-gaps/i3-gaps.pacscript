#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <basak.sb2006@gmail.com>"

name="i3-gaps"
pkgname="${name}"
version="4.19.1"
url="https://github.com/Airblader/i3/releases/download/${version}/i3-${version}.tar.xz"
description="i3-gaps – i3 with more features (forked from https://github.com/i3/i3)"
build_depends="meson ninja-build libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev"
gives="i3"
breaks="i3-git i3-bin i3-gaps-bin i3-wm"
hash="fb26783dcef33d97f080129b8d0b2b957c486b1241988744e3b9658f1f05646d"
removescript="yes"

prepare() {
  meson builddir && cd builddir
}

build() {
  meson --prefix /usr/src/pacstall/"${name}"
  ninja
}

install() {
  DESTDIR=/usr/src/pacstall/"${name}" ninja install
}

postinst() {
  ln -sf /usr/src/pacstall/i3-gaps/usr/local/share/xsessions/i3.desktop /usr/share/xsessions/i3.desktop
  ln -sf /usr/src/pacstall/i3-gaps/usr/local/share/xsessions/i3-with-shmlog.desktop /usr/share/xsessions/i3-with-shmlog.desktop
}

removescript() {
  rm -f /usr/share/xsessions/i3.desktop
  rm -f /usr/share/xsessions/i3-with-shmlog.desktop
}
