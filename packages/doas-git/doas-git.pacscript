#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="doas-git"
gives="doas"
pkgdesc="A port of OpenBSD's doas(1), an alternative to sudo(1)"
source=(
  "https://github.com/slicer69/doas.git"
  "doas-pam::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/doas-git/doas-pam"
  "doas.conf::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/doas-git/doas.conf"
)
pkgver="6.3p9"
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app")
makedepends=("make" "bison" "flex" "libpam0g-dev")
sha256sums=(
  "b66e7a55fc1b7fd1f6443861f65bde87a4794c4721dee5e11dc0294f27116efc"
  "SKIP"
  "SKIP"
)

prepare() {
  cd "${_archive}"
  ## Download PAM configuration file
  # Check checksum
  if [[ $(sha512sum "${srcdir}/doas-pam" | cut -d" " -f 1) != "87fb25e2f2727b9c1231ce1c14a65dcccc3abc81131c24ec4732b35796695305caabf0b57a74197152814c06747ace70628cb0fb8bd9e53072ca5361e90c74b9" ]]; then
    fancy_message error "Downloading PAM configuration file failed. Checksum mismatch"
    return 1
  fi

  ## Download ${srcdir}/doas.configuration file
  # Check checksum
  if [[ $(sha512sum "${srcdir}/doas.conf" | cut -d" " -f 1) != "f7baffce92cd0ab44a83fc2e236068668f47c8ef78398f354af8ae982b820fe2549320cb9996a14fd698df20f257c2daf69a8f6072b515611ea75afdff4d5f96" ]]; then
    fancy_message error "Downloading Doas configuration file failed. Checksum mismatch"
    return 1
  fi
}

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  # Install license
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"

  # Install doas
  sudo make -j"${NCPU}" PREFIX="/usr" DESTDIR="${pkgdir}" MANDIR="${pkgdir}/usr/share/man" install

  # Install PAM configuration file
  sudo install -Dm644 "${srcdir}/doas-pam" "${pkgdir}/etc/pam.d/doas"

  # Install ${srcdir}/doas.configuration file
  sudo install -Dm644 "${srcdir}/doas.conf" "${pkgdir}/etc/doas.conf"
}

post_install() {
  fancy_message info "Edit the configuration in /etc/doas.conf"
  fancy_message info "by adding your username or other values"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
