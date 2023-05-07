#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="doas-git"
pkgname="doas"
description="A port of OpenBSD's doas(1), an alternative to sudo(1)"
url="https://github.com/slicer69/doas.git"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")
build_depends=("make" "bison" "flex" "libpam0g-dev")
hash="b66e7a55fc1b7fd1f6443861f65bde87a4794c4721dee5e11dc0294f27116efc"

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

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
  make -j"$(nproc)"
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install doas
  sudo make -j"$(nproc)" PREFIX="/usr" DESTDIR="${pkgdir}" MANDIR="${pkgdir}/usr/share/man" install

  # Install PAM configuration file
  sudo install -Dm644 "doas-pam" "${pkgdir}/etc/pam.d/doas"

  # Install doas configuration file
  sudo install -Dm644 "doas.conf" "${pkgdir}/etc/doas.conf"
}

postinst() {
  fancy_message info "Edit the configuration in /etc/doas.conf"
  fancy_message info "by adding your username or other values"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
