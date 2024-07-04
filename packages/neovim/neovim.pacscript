pkgname="neovim"
pkgver="0.10.0"
pkgrel="2"
source=(
  "https://github.com/neovim/neovim/archive/refs/tags/v${pkgver}.tar.gz"
  "ex"
  "rview"
  "rvim"
  "view"
  "vimdiff"
)
url='https://neovim.io/'
makedepends=("gettext" "libtool" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config")
replaces=("neovim" "nvim" "neovim-runtime")
pkgdesc="Neovim is a vim fork maintained by the community"
sha256sums=(
  "372ea2584b0ea2a5a765844d95206bda9e4a57eaa1a2412a9a0726bab750f828"
  "5d3178628afc39f0318638cad19e9ad06ada89926dfb263e93ab35cc8f60e911"
  "f04c9baa97f49afe7969826b45e283c60e2d52e28aa3ea7fa93a62dab0408a55"
  "8528f61eaca19285c8220c7d12099743d76abf872a30515698644c91a05c55e0"
  "3cb963a264b6cf45749627408b5a62c6945e5e426b595bb5e6a388194c2c1990"
  "1d3123b9d97a4889696ab72db558041b5cca8e26ff51ae557f7842242a7d4ed1"
)
maintainer=("Elsie19 <elsie19@pm.me>")
external_connection=true
repology=("project: ${pkgname}")

build() {
  cd "${pkgname}"
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"${NCPU}"
}

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm755 "${srcdir}/ex" -t "${pkgdir}/usr/libexec/${pkgname}"
  install -Dm755 "${srcdir}/rview" -t "${pkgdir}/usr/libexec/${pkgname}"
  install -Dm755 "${srcdir}/rvim" -t "${pkgdir}/usr/libexec/${pkgname}"
  install -Dm755 "${srcdir}/view" -t "${pkgdir}/usr/libexec/${pkgname}"
  install -Dm755 "${srcdir}/vimdiff" -t "${pkgdir}/usr/libexec/${pkgname}"
}

post_install() {
  set -e

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
  set -e

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
