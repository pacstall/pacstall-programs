name="cheat"
gives="cheat"
repology=("project: cheat")
version="4.4.0"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
url="https://github.com/cheat/cheat/releases/download/${version}/cheat-linux-amd64.gz"
homepage="https://github.com/cheat/cheat"
description="Create and view interactive cheatsheets on the command-line"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

install() {
  gunzip cheat-linux-amd64.gz
  chmod +x cheat-linux-amd64
  sudo mv cheat-linux-amd64 "/usr/local/bin/cheat"
}

removescript() {
  sudo rm -rf "/usr/local/bin/cheat"
}
