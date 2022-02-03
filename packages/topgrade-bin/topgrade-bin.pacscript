name="topgrade-bin"
pkgname="topgrade"
version="8.2.0"
url="https://github.com/r-darwish/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="5d2588260673d93355744a974f85cff8cb9eceb60fff45e26f625130f051151c"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
gives="${pkgname}"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 "${pkgname}" -t "${STOWDIR}/${name}/usr/bin"
}
