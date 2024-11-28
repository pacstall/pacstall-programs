pkgname="exiftool"
pkgver="13.03"
pkgdesc="Platform-independent Perl library for reading and writing EXIF data"
maintainer=("Ishaque <muhammadishaque812@gmail.com>")
url="https://exiftool.org"
arch=('any')
license=("GPL-2.0-or-later")
depends=('perl')
gives="exiftool"
repology=("project: ${gives}")

source=("https://exiftool.org/Image-ExifTool-${pkgver}.tar.gz")
sha256sums=('0912e1315318889574f355e5832340632c556a14d30711e94d801085ad0a8e4f')

prepare() {
  cd "Image-ExifTool-${pkgver}"
}

build() {
  cd "Image-ExifTool-${pkgver}"
  perl Makefile.PL
  make
}

package() {
  cd "Image-ExifTool-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install documentation
  install -Dm644 README "${pkgdir}/usr/share/doc/${name}/README"
  install -Dm644 Changes "${pkgdir}/usr/share/doc/${name}/Changes"
}
