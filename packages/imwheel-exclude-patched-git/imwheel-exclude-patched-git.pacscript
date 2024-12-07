pkgname="imwheel-exclude-patched-git"
source=("https://github.com/ajh3/imwheel-exclude-patched.git")
arch=("any")
pkgver="0.0.1"
makedepends=("libx11-dev" "libxtst-dev" "libxmu-dev")
breaks=("imwheel")
pkgdesc="This project is a fork of imwheel's final official release containing only one change — a patch that repairs imwheel's broken @Exclude command"

prepare() {
  cd "imwheel-exclude-patched"
  ./configure --disable-gpm-doc
}

build() {
  cd "imwheel-exclude-patched"
  make
}

package() {
  cd "imwheel-exclude-patched"
  make install DESTDIR="${pkgdir}"
  cd "${pkgdir}/usr/local/"
  mkdir -p share
  if [[ -d man ]]; then
    mv man share/
  fi
}
