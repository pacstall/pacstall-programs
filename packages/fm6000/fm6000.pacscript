name="fm6000"
version="5.0"
url="https://github.com/anhsirk0/fetch-master-6000.git"
build_depends=""
depends="perl"
breaks="fm6000"
gives="fm6000"
description="A simple fetch tool written in Perl"
hash="d0127441a11db8d640a28753a8494a5155514e161415ca7b2c5ab3b33024517f"
prepare() {
        true
}

build() {
        chmod +x fm6000.pl
}

install() {
        sudo cp fm6000.pl /usr/src/pacstall/fm6000/usr/bin
}
