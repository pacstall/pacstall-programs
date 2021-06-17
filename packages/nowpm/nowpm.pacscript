name="nowpm"
version="1.0"
url="https://github.com/jnats/nowpm/archive/refs/tags/v1.0.zip"
description="the no-bullshit wpm utility"
depends="wdiff"
breaks="foo"
hash="293e22e3ccdffd3e5db70ff025f66369d6550a1ea7fc18af538bc8d83f91b790"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo mkdir -p /usr/src/pacstall/nowpm/usr/bin
    chmod +x nowpm
    sudo mv nowpm /usr/src/pacstall/nowpm/usr/bin
}
