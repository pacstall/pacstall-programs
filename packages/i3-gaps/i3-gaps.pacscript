#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="i3-gaps"
pkgname="i3"
pkgdir="${STOWDIR}/${name}"
version="4.21.1"
url="https://github.com/Airblader/${pkgname}/releases/download/${version}/${pkgname}-${version}.tar.xz"
description="i3-gaps – i3 with more features (forked from https://github.com/i3/i3)"
build_depends="meson ninja-build libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app ${pkgname}-deb ${name}-bin ${name}-git ${name}-app ${name}-deb"
hash="b85f2c58b89d40b330b7f7362bf5c9e63579f705d0f7f87a69aa1bac43ffdfb1"
repology=("project: i3-gaps")

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
  sudo ln -sf "/usr/local/share/xsessions/${pkgname}.desktop" "/usr/share/xsessions/${pkgname}.desktop"
  sudo ln -sf "/usr/local/share/xsessions/${pkgname}-with-shmlog.desktop" "/usr/share/xsessions/${pkgname}-with-shmlog.desktop"
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
