# Original Pacscript Creator: wizard-28 <wiz28@pm.me>
name="treefetch-bin"
pkgname="treefetch"
pkgver="2.0.0"
pkgdesc="A lightning-fast system fetch tool made with Rust"
source=("https://github.com/angelofallars/treefetch/releases/download/v${pkgver}/treefetch")
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash=("1a835bafa75ecd2f18a53c3e0d73cf742a579106af03c4c459e5f8c873ee5187")
maintainer="angelofallars <ba.fallaria@gmail.com>"

package() {
  sudo install -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
