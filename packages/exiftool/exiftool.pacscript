pkgname="exiftool"
pkgver="13.32"
pkgdesc="Platform-independent Perl library for reading and writing EXIF data"
maintainer=("Ishaque <muhammadishaque812@gmail.com>")
url='https://exiftool.org'
arch=('any')
license=("GPL-2.0-or-later")
depends=('perl')
repology=("project: ${pkgname}")
source=("https://exiftool.org/Image-ExifTool-${pkgver}.tar.gz")
sha256sums=('e4b462f1a111bde3e3c4519e06d71efaacc576c36f4c3407b3d225c39393c829')

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
