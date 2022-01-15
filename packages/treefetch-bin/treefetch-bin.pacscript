# Original Pacscript Creator: wizard-28 <wiz28@pm.me>
name="treefetch-bin"
pkgname="treefetch"
pkgdir="${STOWDIR}/${name}"
version="2.0.0"
description="A lightning-fast system fetch tool made with Rust"
url="https://github.com/angelofallars/treefetch/releases/download/v${version}/treefetch"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="1a835bafa75ecd2f18a53c3e0d73cf742a579106af03c4c459e5f8c873ee5187"
maintainer="angelofallars <ba.fallaria@gmail.com>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
