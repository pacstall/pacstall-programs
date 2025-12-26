pkgname='libeditline-troglobit'
_pkgname='editline'
arch=("any")
pkgver='1.17.1'
pkgdesc='A readline() replacement for UNIX without termcap (ncurses)'
url='https://troglobit.com/projects/editline/'
license=('custom:permissive')
makedepends=('automake' 'libtool')
repology=('project: editline-troglobit')
source=("${pkgname}::https://github.com/troglobit/editline.git#tag=${pkgver}")

build() {
  cd "${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  # avoid libedit conflict
  mv "${pkgdir}"/usr/share/man/man3/editline{,-troglobit}.3

  # license
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # additional documentation
  install -dm644 "${pkgdir}/usr/share/doc"
  cp -r docs "${_}/${pkgname}"
}
