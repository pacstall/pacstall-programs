#!/usr/bin/env bash

pkgname="scangearmp2-deb"
pkgver="3.40"
gives="scangearmp2"
pkgdesc="Scanner driver for Canon Pixma MG3000 series"
arch=("amd64" "i386")
url="https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mg_series/pixma_mg3000.aspx"

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
optdepends=("canon-pixma-mg3000-complete-deb: Printing driver for Canon Pixma MG3000 series")
replaces=("${gives}")
maintainer=("aKqir24 <aKqir24@github.com>")
source_amd64=("https://files.catbox.moe/o3gvrl.deb")
source_i386=("https://files.catbox.moe/7mgcmi.deb")
