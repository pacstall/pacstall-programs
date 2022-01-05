name="amfora-bin"
pkgname="amfora"
version="1.9.2"
pkgdir="${STOWDIR}/${name}"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
description="Amfora aims to be the best looking Gemini client with the most features"
hash="a468f97f0e3fa1d69868980fd0e5893388ccd9c849874d26e4d0b426fd6bff3e"
url="https://github.com/makeworld-the-better-one/amfora/releases/download/v${version}/amfora_${version}_linux_64-bit"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 amfora_"${version}"_linux_64-bit "${pkgdir}/usr/bin/${pkgname}"
}
