name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.6.2"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="aec725d35d8d6aa3e11382da9cecbd0e7a49ec6aab27ee1966238c92b45679b5"
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
