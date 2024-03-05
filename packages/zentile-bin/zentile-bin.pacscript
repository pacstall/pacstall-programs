#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="zentile-bin"
pkgname="zentile"
pkgver="0.1.1"
pkgdesc="Automatic Tiling for EWMH Complaint Window Managers."
source=("https://github.com/blrsn/zentile/releases/download/v${pkgver}/${pkgname}_linux_amd64")
gives="zentile"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash=("3448835def513588bde74ecd98ed1b5e03c4269f32c90e31846e608b3eabcc33")
arch=('amd64')

package() {
  # Install binary
  sudo install -Dm755 "${pkgname}_linux_amd64" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
