name="neovim"
version="0.9.0"
url="https://github.com/neovim/neovim/archive/refs/tags/v${version}.tar.gz"
homepage='https://neovim.io/'
build_depends=("gettext" "libtool" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config")
replace=("neovim" "nvim" "neovim-runtime")
description="Neovim is a vim fork maintained by the community"
hash="39d79107c54d2f3babcad2cd157c399241c04f6e75e98c18e8afaf2bb5e82937"
maintainer="Henryws <hwengerstickel@pm.me>"
repology=("project: ${name}")

build() {
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
