pkgname="softmaker-freeoffice-2024-deb"
gives="softmaker-freeoffice-2024"
pkgver="3645"
buildver="1215-01"
url='https://www.softmaker.com'
repology=("project: softmaker-freeoffice-2024")
arch=('amd64')
sha256sums=("62364de3f86054031851131b85f99e20ce47fc8eafe5043cd77f6ab1ac8b978e")
source=("https://www.softmaker.net/down/${gives}_${buildver}_amd64.deb")
depends=(
  'libcurl4 | libcurl3>=7.16.2' 'libc6' 'libgl1-mesa-glx | libgl1'
  'libglib2.0-0' 'libgstreamer-plugins-base1.0-0' 'libgstreamer1.0-0'
  'libstdc++6' 'libx11-6' 'libxext6' 'libxmu6' 'libxrandr2' 'libxrender1'
)
conflicts=("softmaker-office-2024-deb" "softmaker-office-2024" "softmaker-freeoffice-2024")
replaces=("${conflicts[@]}")
pkgdesc="Proprietary office suite; word processing, spreadsheets, presentations; limited feature free edition"
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

# vim:set ft=sh ts=2 sw=2 et:
