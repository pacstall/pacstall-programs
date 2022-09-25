name="bitwarden-cli-bin"
pkgname="bitwarden-cli"
gives="bw"
repology=("project: ${pkgname}")
version="2022.9.0"
url="https://github.com/bitwarden/clients/releases/download/cli-v${version}/${gives}-linux-${version}.zip"
breaks="${pkgname}-git"
replace="${pkgname}"
description="Bitwarden's command-line interface - Binary"
hash="9a6687dd33aec02239619b23bcede31195028bb01e022b82505031da638d5a29"
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
