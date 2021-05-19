name="exa"
pkgname="exa"
version="0.10.1"
url="https://github.com/ogham/exa.git"
build_depends="libgit2-dev cmake rustc"
description="exa is an improved file lister with more features and better defaults"
#hash="a65a87bd545e969979ae9388f6333167f041a1f09fa9d60b32fd3072348ff6ce"
maintainer="Henryws <hwengerstickel@pm.me>"
prepare() {
    true
}

build() {
    cargo build -j$(nproc) --release
}

install() {
    sudo mkdir -p /usr/src/pacstall/exa/usr/bin
    sudo mv target/release/exa /usr/src/pacstall/exa/usr/bin
    chmod +x /usr/src/pacstall/exa/usr/bin/exa
}
