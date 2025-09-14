pkgname="libreoffice-bin"
gives="libreoffice"
repology=("project: ${gives}")
pkgver="25.8.1"
pkgdesc="Free and powerful office suite"
arch=('amd64' 'arm64')
license=('MPL-2.0' 'LGPL-3.0-or-later')
depends=('dbus' 'libglib2.0-0' 'hicolor-icon-theme' 'libxml2-dev')
optdepends=(
  "coinor-cbc: required by the Calc solver"
  "libgstreamer-plugins-base1.0-0: for multimedia content"
  "libgtk-3-0: for GTK3 integration"
  "default-jdk: required by extension-wiki-publisher and extension-nlpsolver"
  "default-jre: adds java support"
  "libqt5gui5: for Qt5 desktop integration"
)
source_amd64=("https://download.documentfoundation.org/libreoffice/stable/${pkgver}/deb/LibreOffice_${pkgver}_Linux_x86-64_deb.tar.gz")
source_arm64=("https://download.documentfoundation.org/libreoffice/stable/${pkgver}/deb/LibreOffice_${pkgver}_Linux_aarch64_deb.tar.gz")
sha256sums_amd64=("f367c434aee8352e9742e192bedcdaef194ffcbcfeaf760c6300fb4fecbba73c")
sha256sums_arm64=("9a73b06dba875f55a01397d31771ec845218ed83e313140c977eb44223ad2e66")
provides=("${gives}" "${gives}-en-US")
conflicts=("${pkgname}" "${gives}")
replaces=("${conflicts[@]}")
maintainer=("akqir24 <aKqir24@github.com>")
