name="topgrade-bin"
pkgname="topgrade"
version="8.2.0"
url="https://github.com/r-darwish/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="54fe60ef70b21b34c50c0d342ec120aff3a9522ef44a9737f42d5700aed7a1c3"
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
