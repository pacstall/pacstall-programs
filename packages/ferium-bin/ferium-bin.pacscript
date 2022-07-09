name="ferium-bin"
pkgname="ferium"
breaks="${pkgname}"
replace="${pkgname}-git"
repology=("project: ${pkgname}")
version="4.1.5"
url="https://github.com/gorilla-devs/${pkgname}/releases/download/v${version}/${pkgname}-linux-gnu-nogui.zip"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 ferium "${STOWDIR}/${name}/usr/bin/${pkgname}"
}
