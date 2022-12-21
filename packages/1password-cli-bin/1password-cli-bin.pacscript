name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.11.0"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="461106c0e894c7aa6b11d1af7aa692817940f2ed935c83164651520ce7bf3298"
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
