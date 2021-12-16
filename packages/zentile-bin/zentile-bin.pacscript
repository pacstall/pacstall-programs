name="zentile-bin"
pkgname="zentile"
pkgdir="${STOWDIR}/${name}"
version="0.1.1"
description="Automatic Tiling for EWMH Complaint Window Managers."
url="https://github.com/blrsn/zentile/releases/download/v${version}/${pkgname}_linux_amd64"
gives="zentile"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="3448835def513588bde74ecd98ed1b5e03c4269f32c90e31846e608b3eabcc33"

prepare() {
  true
}

build() {
  true
}

install() {
  # Install binary
  sudo install -Dm755 "${pkgname}_linux_amd64" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
