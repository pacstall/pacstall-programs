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
url="https://github.com/slicer69/doas.git"
pkgver="6.3p9"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")
makedepends=("make" "bison" "flex" "libpam0g-dev")
hash="b66e7a55fc1b7fd1f6443861f65bde87a4794c4721dee5e11dc0294f27116efc"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  ## Download PAM configuration file
  sudo wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/doas-git/doas-pam"
  # Check checksum
  if [[ $(sha512sum "doas-pam" | cut -d" " -f 1) != "87fb25e2f2727b9c1231ce1c14a65dcccc3abc81131c24ec4732b35796695305caabf0b57a74197152814c06747ace70628cb0fb8bd9e53072ca5361e90c74b9" ]]; then
    fancy_message error "Downloading PAM configuration file failed. Checksum mismatch"
    return 1
  fi

  ## Download doas configuration file
  sudo wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/doas-git/doas.conf"
  # Check checksum
  if [[ $(sha512sum "doas.conf" | cut -d" " -f 1) != "f7baffce92cd0ab44a83fc2e236068668f47c8ef78398f354af8ae982b820fe2549320cb9996a14fd698df20f257c2daf69a8f6072b515611ea75afdff4d5f96" ]]; then
    fancy_message error "Downloading Doas configuration file failed. Checksum mismatch"
    return 1
  fi
}

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
