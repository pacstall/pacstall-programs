name="apx-git"
pkgname="apx"
url="https://github.com/Vanilla-OS/apx.git"
build_depends="golang-go"
pacdeps=("distrobox")
breaks=("${pkgname}")
description="Package manager meant to be simple to use, but also powerful with support to installing packages from multiple sources without altering the root filesystem"
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
incompatible=("debian:bullseye")
version="$(pkgver)"

prepare() {
  sed -i "s;/usr/lib/apx/distrobox;/usr/bin/distrobox;" config/config.json
}

build() {
  go build
}

install() {
  sudo install -Dm755 "apx" "${pkgdir}/usr/bin/apx"
  sudo install -Dm644 "config/config.json" -t "${pkgdir}/etc/apx/"
  sudo install -Dm644 "man/apx.1" -t "${pkgdir}/usr/share/man/man1"
  sudo install -Dm644 "man/es/apx.1" -t "${pkgdir}/usr/share/man/es/man1"
  sudo install -Dm644 "COPYING.md" -t "${pkgdir}/usr/share/licenses/${name}"
}
