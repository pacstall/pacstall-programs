pkgname='libeditline-troglobit-git'
gives='libeditline-troglobit'
arch=("any")
pkgver='1.17.1'
pkgdesc='A readline() replacement for UNIX without termcap (ncurses)'
url='https://troglobit.com/projects/editline/'
license=('custom:permissive')
makedepends=('automake' 'libtool')
maintainer=('vigress8 <vig@disroot.org>')
repology=('project: editline-troglobit')
source=(
  "${gives}::https://github.com/troglobit/editline.git"
  "https://github.com/lix-project/lix/raw/c95b73d8a1cce06f1ec3ee08617e76380d62f4df/nix-support/editline.patch"
)
sha256sums=(
  'SKIP'
  '7b1cbfa7856e6190df1172031c7d670640bde7e62950342021dbecd69e299b84'
)

build() {
  cd "${gives}"
  patch -sp1 < editline.patch
  ./autogen.sh
  ./configure --prefix=/usr
  make -j"${NCPU}"
}

package() {
  cd "${gives}"
  make DESTDIR="${pkgdir}" install

  # avoid libedit conflict
  mv "${pkgdir}"/usr/share/man/man3/editline{,-troglobit}.3

  # license
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"

  # additional documentation
  install -dm644 "${pkgdir}/usr/share/doc"
  cp -r docs "${_}/${gives}"
}
