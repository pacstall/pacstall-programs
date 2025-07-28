pkgname="softmaker-office-nx-deb"
gives="softmaker-office-nx"
pkgver="3643"
buildver="1214-01"
url='https://www.softmaker.com'
repology=("project: softmaker-office-nx")
arch=('amd64')
sha256sums=("c397a47c60fc34fb17f1fda6da00c3143c99c0e38d6b38421a051b26536e9b0f")
source=("https://www.softmaker.net/down/${gives}_${buildver}_amd64.deb")
depends=(
  'libcurl4 | libcurl3>=7.16.2' 'libc6' 'libgl1-mesa-glx | libgl1'
  'libglib2.0-0' 'libgstreamer-plugins-base1.0-0' 'libgstreamer1.0-0'
  'libstdc++6' 'libx11-6' 'libxext6' 'libxmu6' 'libxrandr2' 'libxrender1'
)
conflicts=("softmaker-office-nx")
replaces=("${conflicts[@]}")
pkgdesc="Proprietary office suite; word processing, spreadsheets, presentations; subscription edition"
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

# vim:set ft=sh ts=2 sw=2 et:
