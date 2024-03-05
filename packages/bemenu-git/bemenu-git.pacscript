#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="bemenu-git"
pkgname="bemenu"
pkgdesc="Dynamic menu library and client program inspired by dmenu (git release)"
source=("https://github.com/Cloudef/bemenu.git")
pkgver="0.6.15"
makedepends=("scdoc" "wayland-protocols" "libcairo-dev" "libpango1.0-dev" "libxkbcommon-dev" "libwayland-dev" "libxinerama-dev" "libncurses5-dev")
breaks="${pkgname}-bin ${pkgname}"

build() {
  # Build nessesary files
  make -j"${NCPU}"
}

package() {
  # Install license
  sudo install -Dm644 "LICENSE-CLIENT" "LICENSE-LIB" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install bemenu-git
  sudo make install DESTDIR="${pkgdir}"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
