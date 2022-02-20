name="exa-git"
pkgname="exa"
gives="exa"
url="https://github.com/ogham/exa.git"
build_depends="cargo libgit2-dev cmake rustc"
description="exa is an improved file lister with more features and better defaults"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgdir="${STOWDIR}/${name}"
pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
    true
}

build() {
    cargo build -j$(nproc) --release
}

install() {
    sudo install -Dm755 target/release/exa -t "${pkgdir}"/usr/bin
}
