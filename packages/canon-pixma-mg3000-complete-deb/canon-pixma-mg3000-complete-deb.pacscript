#!/usr/bin/env bash

pkgname="canon-pixma-mg3000-complete-deb"
pkgver="5.40"
gives="cnijfilter2"
pkgdesc="Complete stand alone driver set printing for Canon Pixma MG3000 series"
arch=("amd64" "i386")
url='https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mg_series/pixma_mg3000.aspx'

depends=(
  "libc6>=2.7"
  "libgcc1"
  "libcups2"
  "libstdc++6"
  "binutils"
  "cups"
  "libxml2>=2.7.4"
  "libcupsimage2>=1.4.0"
  "libusb-0.1-4"
  "libpopt0"
  "libtiff6"
)
optdepends=("scangearmp2-deb: Scanner driver for Canon")
replaces=("${gives}")
maintainer=("aKqir24 <aKqir24@github.com>")
source_amd64=("https://files.catbox.moe/mmxzt2.deb")
source_i386=("https://files.catbox.moe/8tiosl.deb")

package() {
  _ppdFile="canonmg3000.ppd"

  install -Dm644 /usr/share/ppd/"${_ppdFile}" \
    "${pkgdir}/usr/share/cups/model/${_ppdFile}"

  rm -rf usr/share/ppd
  cp -a usr "${pkgdir}/"

  find usr/share/doc -name 'LICENSE*' -exec install -Dm644 {} \
    "${pkgdir}/usr/share/licenses/${pkgname}/$(basename {})" \;
}

post_install() {
  fancy_message info "To make this driver work, make sure the cups service is running.\n
  If not then, run sudo systemctl enable cups.service"
}
