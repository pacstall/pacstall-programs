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
arch=("any")
pkgver="6.3p9"
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app")
makedepends=("make" "bison" "flex" "libpam0g-dev")
sha512sums=(
  "SKIP"
  "87fb25e2f2727b9c1231ce1c14a65dcccc3abc81131c24ec4732b35796695305caabf0b57a74197152814c06747ace70628cb0fb8bd9e53072ca5361e90c74b9"
  "f7baffce92cd0ab44a83fc2e236068668f47c8ef78398f354af8ae982b820fe2549320cb9996a14fd698df20f257c2daf69a8f6072b515611ea75afdff4d5f96"
)

build() {
  cd "doas"
  make -j"${NCPU}"
}

package() {
  cd "doas"
  # Install license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"

  # Install doas
  make -j"${NCPU}" PREFIX="/usr" DESTDIR="${pkgdir}" MANDIR="${pkgdir}/usr/share/man" install

  # Install PAM configuration file
  install -Dm644 "${srcdir}/doas-pam" "${pkgdir}/etc/pam.d/doas"

  # Install ${srcdir}/doas.configuration file
  install -Dm644 "${srcdir}/doas.conf" "${pkgdir}/etc/doas.conf"
}

post_install() {
  fancy_message info "Edit the configuration in /etc/doas.conf"
  fancy_message info "by adding your username or other values"
}

# vim:set ft=sh ts=2 sw=2 et:
