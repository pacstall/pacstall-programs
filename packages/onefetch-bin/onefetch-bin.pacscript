name="onfetch-bin"
pkgname="onefetch"
version="2.12.0"
url="https://github.com/o2sh/onefetch/releases/download/v${version}/onefetch-linux.tar.gz"
description="Git repository summary on your terminal"
gives="onefetch"
hash="fa5e8eb59d1175b435140274fa67693cf838b7f33c454509be373b45a8085a18"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo mkdir -p /usr/src/pacstall/onefetch-bin/usr/bin
    cd /tmp/pacstall
    chmod +x onefetch
    sudo mv onefetch /usr/src/pacstall/onefetch-bin/usr/bin
}
