name="exa-git"
pkgname="exa"
gives="exa"
url="https://github.com/ogham/exa.git"
homepage='https://the.exa.website/'
build_depends=("cargo" "libgit2-dev" "cmake" "rustc")
description="exa is an improved file lister with more features and better defaults"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  cargo build -j"$(nproc)" --release
}

install() {
  sudo install -Dm755 target/release/exa -t "${pkgdir}/usr/bin"
}
