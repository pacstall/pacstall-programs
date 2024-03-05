name="imwheel-exclude-patched-git"
source=("https://github.com/ajh3/imwheel-exclude-patched.git")
pkgver="0.0.1"
makedepends=("libx11-dev" "libxtst-dev" "libxmu-dev")
breaks=("imwheel")
pkgdesc="This project is a fork of imwheel's final official release containing only one change — a patch that repairs imwheel's broken @Exclude command"

prepare() {
  ./configure --disable-gpm-doc
}

build() {
  make
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  cd "${pkgdir}/usr/local/"
  sudo mkdir -p share
  if [[ -d man ]]; then
    sudo mv man share/
  fi
}
