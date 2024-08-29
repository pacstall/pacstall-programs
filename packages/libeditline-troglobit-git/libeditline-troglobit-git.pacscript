pkgname='libeditline-troglobit-git'
gives='libeditline-troglobit'
pkgver='1.17.1'
pkgdesc='A readline() replacement for UNIX without termcap (ncurses)'
url='https://troglobit.com/projects/editline/'
license=('custom:permissive')
makedepends=('automake' 'libtool')
maintainer=('vigress8 <vig@disroot.org>')
repology=('project: editline-troglobit')
source=("${gives}::https://github.com/troglobit/editline.git")

build() {
  cd "${gives}"
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
