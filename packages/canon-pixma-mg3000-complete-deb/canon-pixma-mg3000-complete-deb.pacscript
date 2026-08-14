pkgname="canon-pixma-mg3000-deb"
pkgver="5.40"
gives="cnijfilter2"
pkgdesc="Complete stand alone driver set printing for Canon Pixma MG3000 series"
arch=("amd64" "i386")
url='https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mg_series/pixma_mg3000.aspx'

depends=(
  "libc6>=2.7"
  "libgcc-s1 | libgcc1"
  "libcups2t64 | libcups2>=1.2.1"
  "libstdc++6"
  "binutils"
  "cups"
  "libxml2>=2.7.4 | libxml2-16"
  "libcupsimage2t64 | libcupsimage2"
  "libusb-1.0-0>=1.0.6"
  "libpopt0"
  "libtiff6 | libtiff5"
)
optdepends=("scangearmp2-deb: Scanner driver for Canon")
replaces=("${gives}")
maintainer=("aKqir24 <aKqir24@github.com>")
source_amd64=("https://files.catbox.moe/mmxzt2.deb")
source_i386=("https://files.catbox.moe/8tiosl.deb")
sha256sums_amd64=("b98281e43d3f28bc21c6d76de5fa3a6fce3430c79fc1fde6835574f2748085a8")
sha256sums_i386=("ea72ad1a1ef1cb91144e40b8fff0dd9ca9bcf61d893b8bec15dfbb4d8545fe80")

post_install() {
  _ppdFile="canonmg3000.ppd"
  mkdir -p "/usr/share/cups/model"
  curl -L -o "/usr/share/cups/model/${_ppdFile}" \
    "https://gist.githubusercontent.com/aKqir24/8215d85c5788fc969bfa3b7d88f52699/raw/b1325c2889b1bb2905e48d1b3c18738b8fc49a1d/${_ppdFile}"
  fancy_message info "To make this driver work, make sure the cups service is running. If not then, run sudo systemctl enable cups.service"
}
