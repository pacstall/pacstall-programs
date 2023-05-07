name="xfwm4-wayland-git"
url="https://github.com/adlocode/xfwm4.git"
build_depends=("wayland-protocols" "librust-wayland-commons-dev" "libpixman-1-dev" "libcairo-dev" "libpango1.0-dev" "libxcomposite-dev" "libxdamage-dev" "libxrandr-dev" "libxml++2.6-dev" "libgtk-3-dev" "libxfce4util-dev" "libxfce4ui-2-dev" "libwnck-3-dev" "libbsd-dev" "cmake" "meson" "ninja-build")
pacdeps=("libwlroots11-deb" "libwlroots-dev-deb")
depends=("wayland-protocols")
gives="xfwm4-wayland"
description="xfwm4-wayland compositor"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "debian:stretch" "debian:buster" "debian:bullseye")
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b wayland-2 . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  git remote add upstream "${url}"
  git fetch upstream
  git checkout upstream/wayland-2
}

build() {
  sudo meson setup build
}

install() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}
