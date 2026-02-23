pkgname="exiftool"
pkgver="13.51"
pkgdesc="Platform-independent Perl library for reading and writing EXIF data"
maintainer=("Ishaque <muhammadishaque812@gmail.com>")
url='https://exiftool.org'
arch=('any')
license=("GPL-2.0-or-later")
depends=('perl')
repology=("project: ${pkgname}")
source=("https://exiftool.org/Image-ExifTool-${pkgver}.tar.gz")
sha256sums=('73b7f1035b20b00bfb6b15aff32799ec88523e48d5ed46c8952b7c54a3aae70f')

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
