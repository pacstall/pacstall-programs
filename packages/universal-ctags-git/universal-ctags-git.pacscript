pkgname="universal-ctags-git"
gives="universal-ctags"
source=("https://github.com/universal-ctags/ctags.git")
arch=("any")
pkgver="6.0.0"
pkgdesc="Universal Ctags (abbreviated as u-ctags) is a maintained implementation of ctags. ctags generates an index (or tag) file of language objects found in source files for programming languages. This index makes it easy for text editors and other tools to locate the indexed items."
makedepends=("gcc" "make" "pkg-config" "autoconf" "automake" "python3-docutils" "libseccomp-dev" "libjansson-dev" "libyaml-dev" "libxml2-dev")
maintainer=("KwonNam Son <kwon37xi@gmail.com>")

prepare() {
  cd "ctags"
  git fetch --all --tags --prune
  git checkout "tags/${pkgver}" -b "${pkgver}"
  ./autogen.sh
}

build() {
  cd "ctags"
  ./configure --prefix="${pkgdir}/usr" --program-transform-name='s/ctags/ctags-universal/'
  make -j"${NCPU}"

}

package() {
  cd "ctags"
  make install
}

post_install() {
  sudo update-alternatives \
    --install /usr/bin/ctags ctags /usr/bin/ctags-universal 30 \
    --slave /usr/share/man/man1/ctags.1 ctags.1.gz /usr/share/man/man1/ctags-universal.1
}

post_remove() {
  sudo update-alternatives --remove ctags /usr/bin/ctags-universal
}
