name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.4.1"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="5a34601194b0053301b67727baf1715874cb3695e2f02694c67933f3c385c086"
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
