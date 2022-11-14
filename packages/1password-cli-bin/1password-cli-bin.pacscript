name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.7.3"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="4508904cec8040a348781a0545586729df4a92d39242d6ef9bc97c8ab42f4d10"
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
