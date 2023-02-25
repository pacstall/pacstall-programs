name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.13.1"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="8f9130e947cde2ecd88721d812a25a0df06265bacb8b981f24226cb140d887e9"
maintainer="WRM-42 <droppings_cledet@aleeas.com>"

install() {
  sudo install -Dm755 ${gives} -t "${pkgdir}/usr/bin"
}
