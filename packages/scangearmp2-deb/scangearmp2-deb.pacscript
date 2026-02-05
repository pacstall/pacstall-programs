pkgname="scangearmp2-deb"
pkgver="4.20.1"
pkgrel=1
gives="scangearmp2"
pkgdesc="Sane backend for the canon's scanner"
arch=("amd64" "i386")
url='https://github.com/ThierryHFR/scangearmp2'
depends=(
  "libatk1.0-0>=1.29.3"
  "libc6>=2.7"
  "libcairo2>=1.2.4"
  "libfontconfig1>=2.8.0"
  "libfreetype6>=2.2.1"
  "libgcc1"
  "libglib2.0-0>=2.16.0"
  "libgtk2.0-0>=2.12.0"
  "libpango-1.0-0"
  "libstdc++6>=4.1.1"
  "libusb-1.0-0>=2:1.0.6"
)
pacdeps=("canon-pixma-mg3000-complete-deb")
replaces=("${gives}")
maintainer=("aKqir24 <aKqir24@github.com>")
source=("https://github.com/ThierryHFR/${gives}/releases/download/${pkgver}/${gives}_4.20-1bullseye+1_${CARCH}.deb")

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
