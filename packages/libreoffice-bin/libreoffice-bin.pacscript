pkgname="libreoffice-bin"
gives="libreoffice"
repology=("project: ${gives}")
pkgver="25.8.1"
pkgdesc="Free and powerful office suite"
arch=('amd64' 'arm64')
license=('MPL-2.0' 'LGPL-3.0-or-later')
depends=('dbus' 'libglib2.0-0' 'hicolor-icon-theme' 'libxml2')
optdepends=(
  "coinor-libcbc3: required by the Calc solver"
  "libgstreamer-plugins-base1.0-0: for multimedia content"
  "libgtk-3-0: for GTK3 integration"
  "default-jdk: required by extension-wiki-publisher and extension-nlpsolver"
  "default-jre: adds java support"
  "libqt5gui5: for Qt5 desktop integration"
)
source_amd64=("https://www.libreoffice.org/donate/dl/deb-x86_64/${pkgver}/en-US/LibreOffice_${pkgver}_Linux_x86_64_deb.tar.gz")
source_arm64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}_${pkgver}_Linux_aarch64_deb.tar.gz")
sha1sums_amd64=("d98956f6d484f694debd3c41eee261d099158a8a")
sha1sums_arm64=("6810d4bbd04e136ced055c58806c15ce4856306d")
provides=("${gives}" "${gives}-en-US")
conflicts=("${pkgname}" "${gives}")
replaces=("${conflicts[@]}")
maintainer=("akqir24 <aKqir24@github.com>")
