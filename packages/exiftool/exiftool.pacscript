pkgname="exiftool"
pkgver="13.43"
pkgdesc="Platform-independent Perl library for reading and writing EXIF data"
maintainer=("Ishaque <muhammadishaque812@gmail.com>")
url='https://exiftool.org'
arch=('any')
license=("GPL-2.0-or-later")
depends=('perl')
repology=("project: ${pkgname}")
source=("https://exiftool.org/Image-ExifTool-${pkgver}.tar.gz")
sha256sums=('1beef514c895705b3e3eafea3602db6b4830697f37b997b6ae9795cdfa2608d1')

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
