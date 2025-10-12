pkgname="softmaker-office-2024-deb"
gives="softmaker-office-2024"
pkgver="3644"
buildver="1214-01"
url='https://www.softmaker.com'
repology=("project: softmaker-office-2024")
arch=('amd64')
sha256sums=("5c8d36bd11cd2b50f79bd436bfac63206918fc4f5cdb310a37d323bb98310204")
source=("https://www.softmaker.net/down/${gives}_${buildver}_amd64.deb")
depends=(
  'libcurl4 | libcurl3>=7.16.2' 'libc6' 'libgl1-mesa-glx | libgl1'
  'libglib2.0-0' 'libgstreamer-plugins-base1.0-0' 'libgstreamer1.0-0'
  'libstdc++6' 'libx11-6' 'libxext6' 'libxmu6' 'libxrandr2' 'libxrender1'
)
conflicts=("softmaker-freeoffice-2024-deb" "softmaker-freeoffice-2024" "softmaker-office-2024")
replaces=("${conflicts[@]}")
pkgdesc="Proprietary office suite; word processing, spreadsheets, presentations"
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

# vim:set ft=sh ts=2 sw=2 et:
