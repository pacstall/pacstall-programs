name="onfetch-bin"
pkgname="onefetch"
version="2.9.1"
url="https://github.com/o2sh/onefetch/releases/download/v2.9.1/onefetch-linux.tar.gz"
description="Git repository summary on your terminal"
depends=""
gives="onefetch"
hash="f2881da9a96778bfa8ce6a5df0151a07be8012b1828e8262a1f7db95f70463dc"

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

