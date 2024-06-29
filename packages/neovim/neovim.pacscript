pkgname="neovim"
pkgver="0.10.0"
pkgrel="1"
source=(
  "https://github.com/neovim/neovim/archive/refs/tags/v${pkgver}.tar.gz"
  "nview"
  "nvimdiff"

)
url='https://neovim.io/'
makedepends=("gettext" "libtool" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config")
replaces=("neovim" "nvim" "neovim-runtime")
pkgdesc="Neovim is a vim fork maintained by the community"
sha256sums=(
  "372ea2584b0ea2a5a765844d95206bda9e4a57eaa1a2412a9a0726bab750f828"
  "2333e46dfa12daa43706b101d8f179a5a81ee08c89530a45bba9c91ae6bc7c7c"
  "dfc7caa96d5906bdd334ce85a2edd632f0f3f8b75e3f35d92fb182d8dfe16077"
)
maintainer=("Elsie19 <elsie19@pm.me>")
external_connection=true
repology=("project: ${pkgname}")

build() {
  cd "${_archive}"
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm755 "${srcdir}/nview" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/nvimdiff" -t "${pkgdir}/usr/bin"
}

post_install() {
  update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100
  update-alternatives --install /usr/bin/view view /usr/bin/nview 100
  update-alternatives --install /usr/bin/vimdiff vimdiff /usr/bin/nvimdiff 100
}

pre_remove() {
  update-alternatives --remove vimdiff /usr/bin/nvimdiff
  update-alternatives --remove view /usr/bin/nview
  update-alternatives --remove vim /usr/bin/nvim
}
