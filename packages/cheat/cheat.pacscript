name="cheat"
pkgname="arduino-cli"
gives="cheat"
repology=("project: cheat")
version="4.4.0"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=('amd64')
url="https://github.com/cheat/cheat/releases/download/${version}/cheat-linux-amd64.gz"
homepage="https://github.com/cheat/cheat"
description="Create and view interactive cheatsheets on the command-line"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

install() {
  gzip -d cheat-linux-amd64.gz
  sudo install -Dm755 cheat-linux-amd64 "${pkgdir}/usr/bin/${name}"
}
