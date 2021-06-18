#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="i3-gaps"
pkgname="i3"
pkgdir="/usr/src/pacstall/${name}"
version="4.19.1"
url="https://github.com/Airblader/${pkgname}/releases/download/${version}/${pkgname}-${version}.tar.xz"
description="i3-gaps – i3 with more features (forked from https://github.com/i3/i3)"
build_depends="meson ninja-build libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev"
breaks="${pkgname}-git ${pkgname}-bin ${pkgname}-gaps-bin ${pkgname}-wm"
hash="fb26783dcef33d97f080129b8d0b2b957c486b1241988744e3b9658f1f05646d"
removescript="yes"

prepare() {
  # Make build dir
  meson builddir && cd builddir
}

build() {
  # Build i3-gaps
  meson --prefix "${pkgdir}"
  ninja
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"

  # Install i3-gaps
  DESTDIR="${pkgdir}" sudo ninja install
}

postinst() {
  # Install .desktop files
  sudo ln -sf "${pkgdir}/usr/local/share/xsessions/${pkgname}.desktop" "/usr/share/xsessions/${pkgname}.desktop"
  sudo ln -sf "${pkgdir}/usr/local/share/xsessions/${pkgname}-with-shmlog.desktop" "/usr/share/xsessions/${pkgname}-with-shmlog.desktop"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${name}"
  sudo rm -rf "/usr/share/doc/${name}"
  # Remove .desktop files
  sudo rm -f "/usr/share/xsessions/${pkgname}.desktop"
  sudo rm -f "/usr/share/xsessions/${pkgname}-with-shmlog.desktop"
}
# vim:set ft=sh ts=2 sw=2 et:
