name="jetbrains-toolbox-bin"
pkgname="jetbrains-toolbox"
version="1.22.10970"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
replace="${pkgname}"
gives="${pkgname}"
description="JetBrains Toolbox is a suite of professional development tools for a range of languages and technologies using JetBrains IDEs"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
hash="3b2cfc340d9116699d9e83173ea79d325df7f940d6f446d34076833608a99139"
url="https://download-cdn.jetbrains.com/toolbox/${pkgname}-${version}.tar.gz"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo mkdir -p "${STOWDIR}/${name}/usr/bin"
    sudo mv "./${pkgname}" "${STOWDIR}/${name}/usr/bin"
}
