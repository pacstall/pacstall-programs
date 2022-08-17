name="lf-bin"
pkgname="lf"
repology=("project: ${pkgname}")
gives="${pkgname}"
version="27"
url="https://github.com/gokcehan/${pkgname}/releases/download/r${version}/${pkgname}-linux-amd64.tar.gz"
breaks="${pkgname}-git"
replace="${pkgname}"
description="A terminal file manager inspred by ranger written in Go"
hash="b8f9431dc63f7b2cff8e4306cff4c075adbe9f0900b563f91a6b742a41290d7f"
maintainer="Romario <romariorobby@yahoo.com>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 "${gives}" -t "${STOWDIR}/${name}/usr/bin"
}
