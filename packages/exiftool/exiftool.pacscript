pkgname="exiftool"
pkgver="13.31"
pkgdesc="Platform-independent Perl library for reading and writing EXIF data"
maintainer=("Ishaque <muhammadishaque812@gmail.com>")
url='https://exiftool.org'
arch=('any')
license=("GPL-2.0-or-later")
depends=('perl')
repology=("project: ${pkgname}")
source=("https://exiftool.org/Image-ExifTool-${pkgver}.tar.gz")
sha256sums=('3894786f28ef6b625646bf26f033938c104216baefdf94d0178f46a16c5ad5c0')

build() {
  cd "Image-ExifTool-${pkgver}"
  perl Makefile.PL
  make -j"${NCPU}"
}

package() {
  cd "Image-ExifTool-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install documentation
  install -Dm644 README Changes -t "${pkgdir}/usr/share/doc/${pkgname}"
}
