name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.6.0"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="15f5f431013d5bc2bf79cb180a35c8e434f73a912eaa739cfe8644da9dc44420"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo install -Dm755 ${gives} -t "${STOWDIR}/${name}/usr/bin"
}
