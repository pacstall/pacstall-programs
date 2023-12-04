#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="bemenu-git"
gives="bemenu"
pkgdesc="Dynamic menu library and client program inspired by dmenu (git release)"
url="https://github.com/Cloudef/bemenu.git"
pkgver="0.6.15"
makedepends=("scdoc" "wayland-protocols" "libcairo-dev" "libpango1.0-dev" "libxkbcommon-dev" "libwayland-dev" "libxinerama-dev" "libncurses5-dev")
breaks="${gives}-bin ${gives}"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  # Build nessesary files
  make -j"${NCPU}"
}

package() {
  # Install license
  sudo install -Dm644 "LICENSE-CLIENT" "LICENSE-LIB" -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"

  # Install bemenu-git
  sudo make install DESTDIR="${pkgdir}"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
