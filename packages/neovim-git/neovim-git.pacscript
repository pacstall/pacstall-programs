pkgname="neovim-git"
gives="neovim"
pkgver="0.10.1"
repology=("project: ${gives}")
source=(
  "https://github.com/neovim/neovim.git"
  "ex"
  "rview"
  "rvim"
  "view"
  "vimdiff"
)
sha256sums=(
  "SKIP"
  "5d3178628afc39f0318638cad19e9ad06ada89926dfb263e93ab35cc8f60e911"
  "f04c9baa97f49afe7969826b45e283c60e2d52e28aa3ea7fa93a62dab0408a55"
  "8528f61eaca19285c8220c7d12099743d76abf872a30515698644c91a05c55e0"
  "3cb963a264b6cf45749627408b5a62c6945e5e426b595bb5e6a388194c2c1990"
  "1d3123b9d97a4889696ab72db558041b5cca8e26ff51ae557f7842242a7d4ed1"
)
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
  install -Dm755 "${srcdir}/ex" -t "${pkgdir}/usr/libexec/${gives}"
  install -Dm755 "${srcdir}/rview" -t "${pkgdir}/usr/libexec/${gives}"
  install -Dm755 "${srcdir}/rvim" -t "${pkgdir}/usr/libexec/${gives}"
  install -Dm755 "${srcdir}/view" -t "${pkgdir}/usr/libexec/${gives}"
  install -Dm755 "${srcdir}/vimdiff" -t "${pkgdir}/usr/libexec/${gives}"
}

post_install() {
  set -e

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
  set -e

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
