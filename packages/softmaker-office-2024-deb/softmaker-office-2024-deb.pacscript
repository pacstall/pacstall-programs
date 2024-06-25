pkgname="softmaker-office-2024-deb"
gives="softmaker-office-2024"
pkgver="1214"
pkgrel="01"
url="https://www.softmaker.com"
repology=("project: softmaker-office-2024")
arch=('amd64')
license=('custom:"Copyright (c) 2024 SoftMaker GmbH All Rights Reserved."')
sha256sums=("5c8d36bd11cd2b50f79bd436bfac63206918fc4f5cdb310a37d323bb98310204")
source=("https://www.softmaker.net/down/${gives}_${pkgver}-${pkgrel}_amd64.deb")
depends=(
  'libcurl4 | libcurl3>=7.16.2' 'libc6>=2.17' 'libgl1-mesa-glx | libgl1'
  'libglib2.0-0>=2.12.0' 'libgstreamer-plugins-base1.0-0>=1.0.0' 'libgstreamer1.0-0>=1.0.0'
  'libstdc++6>=5.2' 'libx11-6' 'libxext6' 'libxmu6' 'libxrandr2>=2:1.2.99.3' 'libxrender1'
)
replaces=("softmaker-office-2024")
pkgdesc="Proprietary office suite; word processing, spreadsheets, presentations"
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

# vim:set ft=sh ts=2 sw=2 et:
