#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="bemenu-git"
pkgname="bemenu"
pkgdir="/usr/src/pacstall/${name}"
description="Dynamic menu library and client program inspired by dmenu (git release)"
url="https://github.com/Cloudef/bemenu.git"
build_depends="scdoc wayland-protocols libcairo-dev libpango1.0-dev libxkbcommon-dev libwayland-dev libxinerama-dev libncurses5-dev"
breaks="${pkgname}-bin ${pkgname}"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  # Build nessesary files
  make -j"$(nproc)"
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE-CLIENT" "LICENSE-LIB" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install bemenu-git
  sudo make install DESTDIR="${pkgdir}"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
