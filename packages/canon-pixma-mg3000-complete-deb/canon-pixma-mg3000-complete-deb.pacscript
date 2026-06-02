pkgname="canon-pixma-mg3000-complete-deb"
pkgver="5.40"
gives="cnijfilter2"
pkgdesc="Complete stand alone driver set printing for Canon Pixma MG3000 series"
arch=("amd64" "i386")
url='https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mg_series/pixma_mg3000.aspx'

depends=(
  "libc6>=2.7"
  "libgcc-s1 | libgcc1"
  "libcups2"
  "libstdc++6"
  "binutils"
  "cups"
  "libxml2>=2.7.4 | libxml2-16"
  "libcupsimage2"
  "libusb-1.0-0"
  "libpopt0"
  "libtiff6 | libtiff5"
)
optdepends=("scangearmp2-deb: Scanner driver for Canon")
replaces=("${gives}")
maintainer=("aKqir24 <aKqir24@github.com>")
source_amd64=("https://files.catbox.moe/mmxzt2.deb")
source_i386=("https://files.catbox.moe/8tiosl.deb")

post_install() {
  # Since pacstall handles packaging in deb files I need to get the PPD this way
  cd "${pkgdir}"
  _ppdFile="canonmg3000.ppd"
  curl -L -o "usr/share/ppd/${_ppdFile}" https://gist.githubusercontent.com/aKqir24/8215d85c5788fc969bfa3b7d88f52699/raw/b1325c2889b1bb2905e48d1b3c18738b8fc49a1d/"${_ppdFile}"

  install -Dm644 /usr/share/ppd/"${_ppdFile}" \
    "${pkgdir}/usr/share/cups/model/${_ppdFile}"
  fancy_message info "To make this driver work, make sure the cups service is running. If not then, run sudo systemctl enable cups.service"
}
