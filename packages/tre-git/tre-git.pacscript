name="tre-git"
pkgname="tre"
gives="tre"
build_depends=("cargo" "rustc")
description="Tree command, improved"
url="https://github.com/dduan/tre.git"
maintainer="Diego Magdaleno <diegomagdaleno@pm.me>"
incompatible=("debian:bullseye")
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

build() {
  cargo build -j"$(nproc)" --release --locked
}

install() {
  sudo install -Dm755 target/release/tre -t "${pkgdir}/usr/bin"
}
