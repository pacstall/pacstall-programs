pkgname="neovim-git"
gives="neovim"
arch=("any")
pkgver="0.11.4"
repology=("project: ${gives}")
source=("https://github.com/neovim/neovim.git")
url='https://neovim.io/'
pkgdesc="Vim fork maintained by the community"
maintainer=("Elsie19 <elsie19@pm.me>")
makedepends=("ninja-build" "gettext" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config" "unzip")
replaces=("neovim" "nvim" "neovim-runtime" "neovim-git" "neovim-app" "neovim-deb" "neovim-bin")
conflicts=("${replaces[@]}")
external_connection=true

build() {
  cd "${gives}"
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"${NCPU}"
}

package() {
  cd "${gives}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${gives}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${gives}/ex" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -e "$@"
EOF
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${gives}/rview" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -RZ "$@"
EOF
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${gives}/rvim" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -Z "$@"
EOF
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${gives}/view" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -R "$@"
EOF
  install -Dm755 /dev/stdin "${pkgdir}/usr/libexec/${gives}/vimdiff" << 'EOF'
#!/bin/sh
exec /usr/bin/nvim -d "$@"
EOF
}

post_install() {
  update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 30 \
    --slave /usr/share/man/man1/editor.1.gz editor.1.gz \
    /usr/share/man/man1/nvim.1.gz
  update-alternatives --install /usr/bin/ex ex "/usr/libexec/${gives}/ex" 30
  update-alternatives --install /usr/bin/rvim rvim "/usr/libexec/${gives}/rvim" 30
  update-alternatives --install /usr/bin/rview rview "/usr/libexec/${gives}/rview" 30
  update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 30
  update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 30
  update-alternatives --install /usr/bin/view view "/usr/libexec/${gives}/view" 30
  update-alternatives --install /usr/bin/vimdiff vimdiff "/usr/libexec/${gives}/vimdiff" 30
}

pre_remove() {
  case "$1" in
    remove | deconfigure)
      update-alternatives --remove editor /usr/bin/nvim
      update-alternatives --remove ex "/usr/libexec/${gives}/ex"
      update-alternatives --remove rvim "/usr/libexec/${gives}/rvim"
      update-alternatives --remove rview "/usr/libexec/${gives}/rview"
      update-alternatives --remove vi /usr/bin/nvim
      update-alternatives --remove vim /usr/bin/nvim
      update-alternatives --remove view "/usr/libexec/${gives}/view"
      update-alternatives --remove vimdiff "/usr/libexec/${gives}/vimdiff"
      ;;

    upgrade | failed-upgrade) ;;

    *)
      echo "prerm called with unknown argument '$1'" >&2
      exit 0
      ;;
  esac
}

# vim:set ft=sh ts=2 sw=2 et:
