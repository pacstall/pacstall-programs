pkgname="neovim"
arch=("any")
pkgver="0.11.5"
source=("https://github.com/neovim/neovim/archive/refs/tags/v${pkgver}.tar.gz")
url='https://neovim.io/'
makedepends=("gettext" "libtool" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config")
replaces=("neovim" "neovim-git" "nvim" "neovim-runtime")
conflicts=("${replaces[@]}")
pkgdesc="Neovim is a vim fork maintained by the community"
sha256sums=("c63450dfb42bb0115cd5e959f81c77989e1c8fd020d5e3f1e6d897154ce8b771")
maintainer=("Elsie19 <elsie19@pm.me>")
external_connection=true
repology=("project: ${pkgname}")

build() {
  cd "${pkgname}-${pkgver}"
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"${NCPU}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${pkgname}/ex" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -e "$@"
EOF
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${pkgname}/rview" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -RZ "$@"
EOF
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${pkgname}/rvim" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -Z "$@"
EOF
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${pkgname}/view" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -R "$@"
EOF
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${pkgname}/vimdiff" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -d "$@"
EOF
}

post_install() {
  update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 30 \
    --slave /usr/share/man/man1/editor.1.gz editor.1.gz \
    /usr/share/man/man1/nvim.1.gz
  update-alternatives --install /usr/bin/ex ex "/usr/libexec/${pkgname}/ex" 30
  update-alternatives --install /usr/bin/rvim rvim "/usr/libexec/${pkgname}/rvim" 30
  update-alternatives --install /usr/bin/rview rview "/usr/libexec/${pkgname}/rview" 30
  update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 30
  update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 30
  update-alternatives --install /usr/bin/view view "/usr/libexec/${pkgname}/view" 30
  update-alternatives --install /usr/bin/vimdiff vimdiff "/usr/libexec/${pkgname}/vimdiff" 30
}

pre_remove() {
  case "$1" in
    remove | deconfigure)
      update-alternatives --remove editor /usr/bin/nvim
      update-alternatives --remove ex "/usr/libexec/${pkgname}/ex"
      update-alternatives --remove rvim "/usr/libexec/${pkgname}/rvim"
      update-alternatives --remove rview "/usr/libexec/${pkgname}/rview"
      update-alternatives --remove vi /usr/bin/nvim
      update-alternatives --remove vim /usr/bin/nvim
      update-alternatives --remove view "/usr/libexec/${pkgname}/view"
      update-alternatives --remove vimdiff "/usr/libexec/${pkgname}/vimdiff"
      ;;

    upgrade | failed-upgrade) ;;

    *)
      echo "prerm called with unknown argument '$1'" >&2
      exit 0
      ;;
  esac
}
