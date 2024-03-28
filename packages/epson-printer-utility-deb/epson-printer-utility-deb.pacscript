pkgname="epson-printer-utility-deb"
gives="epson-printer-utility"
pkgver="1.1.2"
# find the correct url at http://support.epson.net/linux/Printer/LSB_distribution_pages/en/utility.php
source=(
  "https://download3.ebz.epson.net/dsc/f/03/00/14/68/92/d73ac45cccd3c5c349dbe365b5e99ae3112cbe49/${gives}_${pkgver}-1_amd64.deb"
  "epson-printer-utility.desktop::https://gist.github.com/Zahrun/0759d7356d7b55985292b65642e976f6/raw/c9ef796e550812456dc2990879118ad1a481d792/epson-printer-utility.desktop"
)
depends=("lsb" "libqtgui4")
ppa=("gezakovacs/ppa")
pkgdesc="This is a Printer Utility program for Epson Printer Driver. Using this software, you can check ink levels, view error and other status... on EPSON Printers."
sha256sums=(
  "c34c08476ab185f8fd339e9681a3697cdb3c2e85d454be2aaed11e40b09aedff"
  "SKIP"
)
arch=('amd64')
maintainer=("Zahrun <Zahrun@github.com>")
repology=("project: ${gives}")
incompatible=("ubuntu:lunar" "ubuntu:mantic" "debian:*")

post_install() {
  # install .desktop file
  sudo install -Dm644 "${gives}.desktop" "/usr/share/applications/"
  # enable service to avoid communication error
  sudo systemctl enable ecbd.service
  sudo systemctl start ecbd.service
  # fix ppa if ubuntu release is posterior to groovy
  codename="$(lsb_release -cs)"
  case "${codename}" in
    focal | groovy) ;;
    *)
      sudo sed -i "s/${codename}/groovy/g" "/etc/apt/sources.list.d/gezakovacs-ubuntu-ppa-${codename}.list"
      ;;
  esac
  sudo apt update
  sudo apt install -y libqtgui4
}

post_remove() {
  sudo rm "/usr/share/applications/${gives}.desktop"
  sudo systemctl disable ecbd.service
  sudo systemctl stop ecbd.service
}
