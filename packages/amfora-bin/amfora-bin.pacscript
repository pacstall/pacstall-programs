name="amfora-bin"
pkgname="amfora"
version="1.9.2"
pkgdir="${STOWDIR}/${name}"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
description="Amfora aims to be the best looking Gemini client with the most features"
hash="a468f97f0e3fa1d69868980fd0e5893388ccd9c849874d26e4d0b426fd6bff3e"
url="https://github.com/makeworld-the-better-one/amfora/releases/download/v${version}/amfora_${version}_linux_64-bit"
maintainer="Henryws <hwengerstickel@pm.me>"

prepare() {
  wget -q https://roboticoverlords.org/amfora.png
  wget -q https://raw.githubusercontent.com/makeworld-the-better-one/amfora/master/amfora.desktop
}

build() {
  true
}

install() {
  sudo install -Dm644 amfora.png "${pkgdir}/usr/share/pixmaps/amfora.png"
  sudo install -Dm644 amfora.desktop "${pkgdir}/usr/share/applications/amfora.desktop"
  sudo install -Dm755 amfora_"${version}"_linux_64-bit "${pkgdir}/usr/bin/${pkgname}"
}
