# Original Pacscript Creator: wizard-28 <wiz28@pm.me>
name="treefetch-bin"
pkgname="treefetch"
pkgdir="${STOWDIR}/${name}"
version="1.2.1"
description="A lightning-fast system fetch tool made with Rust"
url="https://github.com/angelofallars/treefetch/releases/download/v${version}/treefetch"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="36587cf0fb90f73e9f984209ddc3ec2c6768c0edbba82cad4f84ad177b76b21e"
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
