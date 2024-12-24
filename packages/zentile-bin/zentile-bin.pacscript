#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="zentile-bin"
gives="zentile"
pkgver="0.1.1"
pkgdesc="Automatic Tiling for EWMH Complaint Window Managers."
source=("https://github.com/blrsn/zentile/releases/download/v${pkgver}/${gives}_linux_amd64")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("3448835def513588bde74ecd98ed1b5e03c4269f32c90e31846e608b3eabcc33")
arch=('amd64')

package() {
  cd "${srcdir}"
  # Install binary
  install -Dm755 "${gives}_linux_amd64" "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
