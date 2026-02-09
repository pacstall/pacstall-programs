pkgname="scangearmp2-sane-git"
pkgver="4.20.1"
pkgrel=1
gives="scangearmp2"
pkgdesc="Scanner driver and gui for Canon Pixma MG3000 series"
arch=("amd64" "i386")
url='https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mg_series/pixma_mg3000.aspx'
depends=(
  "libatk1.0-0>=2.2.0"
  "libc6>=2.7"
  "libcairo2>=1.12.0"
  "libfontconfig1>=2.8.0"
  "libfreetype6>=2.2.1"
  "libgcc1"
  "libglib2.0-0>=2.32.0"
  "libgtk-3-0>=3.24.0"
  "libpango-1.0-0>=1.29.4"
  "libstdc++6>=4.1.1"
  "libusb-1.0-0>=2:1.0.6"
)
makedepends=(
  "sane-utils"
  "git"
  "intltool"
  "cmake"
  "libjpeg62-turbo"
  "libusb-1.0-0>=2:1.0.6"
  "pkg-config"
  "libusb-1.0-0-dev>=2:1.0.6"
  "libgtk-3-dev"
  "libsane-dev"
)
replaces=("${gives}-deb")
conflicts=("${gives}-deb")
maintainer=("aKqir24 <aKqir24@github.com>")
source=("https://github.com/ThierryHFR/scangearmp2.git")


post_install() {
  cd "${srcdir}"
  fancy_message info "Installing ${gives}.desktop file"

  cat << EOF > "${gives}.desktop"
[Desktop Entry]
Type=Application
Name=ScanGear MP
Comment=Scanner interface for Canon printers
Exec=/usr/bin/scangearmp2 %f
Icon=printer-scanner
Terminal=false
Categories=Application;Utilities
EOF

  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}

post_remove() {
  # Remove the .desktop file ( it doesn't work in my machine though )
  sudo rm -f "/usr/share/applications/scangearmp2.desktop"
}

build() {
  cd "${gives}"
  cmake -B build -DCMAKE_INSTALL_PREFIX="/" -DCMAKE_BUILD_TYPE=Release
  make -j"${NCPU}" -C build
}

package() {
  cd "${gives}"
  make -C build install DESTDIR="${pkgdir}"
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/share/scangearmp2/doc/* ${pkgdir}/usr/share/licenses/${pkgname}/
  rmdir ${pkgdir}/usr/share/scangearmp2/doc/
}
