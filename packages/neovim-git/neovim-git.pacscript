name="neovim-git"
gives="neovim"
url="https://github.com/neovim/neovim.git"
homepage='https://neovim.io/'
description="Vim fork maintained by the community"
maintainer="Henryws <hwengerstickel@pm.me>"
build_depends=("ninja-build" "gettext" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config" "unzip")
breaks=("neovim-bin" "neovim" "neovim-app" "neovim-deb")
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
