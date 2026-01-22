pkgname="epson-printer-utility-deb"
gives="epson-printer-utility"
pkgver="1.2.2"
# find the correct url at http://support.epson.net/linux/Printer/LSB_distribution_pages/en/utility.php
source=(
  "https://download3.ebz.epson.net/dsc/f/03/00/16/74/30/9067c71049e81fbbee48a4695c5c0acf308b9f18/${gives}_${pkgver}-1_amd64.deb"
)
pkgdesc="This is a Printer Utility program for Epson Printer Driver. Using this software, you can check ink levels, view error and other status... on EPSON Printers."
sha256sums=(
  "f0e1b61ef6beec5180f6cf31ffbb87f4831b81181ecface5e73d57037d914492"
)
arch=('amd64')
maintainer=("Zahrun <zahrunAtmurenaDotio>")
repology=("project: ${gives}")
