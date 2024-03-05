#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="doas-git"
pkgname="doas"
pkgdesc="A port of OpenBSD's doas(1), an alternative to sudo(1)"
source=(
  "https://github.com/slicer69/doas.git"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/doas-git/doas-pam"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/doas-git/doas.conf"
)
pkgver="6.3p9"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")
makedepends=("make" "bison" "flex" "libpam0g-dev")
hash=(
  "SKIP"
  "b064704fb3448c3511904c3963b0e167ecf6274aea48afb9c42d452447dfd042"
  "1f28802fad6ae0eaa5b94bb8d945ada923631ddfb7ae63e934962dbe41774976"
)

build() {
  make -j"${NCPU}"
}

package() {
  # Install license
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install doas
  sudo make -j"${NCPU}" PREFIX="/usr" DESTDIR="${pkgdir}" MANDIR="${pkgdir}/usr/share/man" install

  # Install PAM configuration file
  sudo install -Dm644 "doas-pam" "${pkgdir}/etc/pam.d/doas"

  # Install doas configuration file
  sudo install -Dm644 "doas.conf" "${pkgdir}/etc/doas.conf"
}

post_install() {
  fancy_message info "Edit the configuration in /etc/doas.conf"
  fancy_message info "by adding your username or other values"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
