name="jetbrains-toolbox-bin"
pkgname="jetbrains-toolbox"
version="1.24.12080"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
replace="${pkgname}"
gives="${pkgname}"
description="JetBrains Toolbox is a suite of professional development tools for a range of languages and technologies using JetBrains IDEs"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
hash="d819065a45d29d53646490fbd8ca45dbcaa3d544bdbc6da4494377460ddf6b79"
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
