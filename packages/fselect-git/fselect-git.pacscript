name="fselect-git"
pkgname="fselect"
gives="fselect"
build_depends=("cargo" "rustc")
description="Find files with SQL-like queries"
url="https://github.com/jhspetersson/fselect.git"
maintainer="Diego Magdaleno <diegomagdaleno@pm.me>"
incompatible=("debian:bullseye")
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  cargo build -j"$(nproc)" --release --locked
}

install() {
  sudo install -Dm755 target/release/fselect -t "${pkgdir}/usr/bin"
}
