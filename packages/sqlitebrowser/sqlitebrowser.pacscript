pkgname="sqlitebrowser"
repology=("project: ${pkgname}")
arch=('amd64')
pkgver="3.13.1"
url='https://sqlitebrowser.org'
source=(
  "https://github.com/sqlitebrowser/sqlitebrowser/archive/refs/tags/v${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/sqlitebrowser/sqlitebrowser/refs/tags/v${pkgver}/distri/sqlitebrowser.desktop"
  "https://raw.githubusercontent.com/sqlitebrowser/sqlitebrowser/refs/tags/v${pkgver}/distri/sqlitebrowser.desktop.appdata.xml"
  "https://raw.githubusercontent.com/sqlitebrowser/sqlitebrowser/refs/tags/v${pkgver}/distri/mime/packages/db4s-sqbpro.xml"
  "https://raw.githubusercontent.com/sqlitebrowser/sqlitebrowser/refs/tags/v${pkgver}/images/logo.svg"
)
sha256sums=(
  "1044ba67d649cabc459eb887c016f70d6a404ad651390ab33bf7859dc7f1b67b"
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
depends=("libqt5xml5t64" "libqscintilla2-qt5-15")
makedepends=(
  "build-essential" "cmake" "libqcustomplot-dev" "libqt5scintilla2-dev" "libsqlcipher-dev"
  "libsqlite3-dev" "qt5-qmake" "qtbase5-dev" "qtbase5-dev-tools" "qtchooser" "qttools5-dev"
  "qttools5-dev-tools"
)
pkgdesc="Database Browser for SQLite"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('MPL-2.0' 'GPL-3.0+')

prepare() {
  cd "${pkgname}-${pkgver}"

  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}/build"

  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/sqlitebrowser.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/sqlitebrowser.desktop.appdata.xml" "${pkgdir}/usr/share/metainfo/sqlitebrowser.desktop.appdata.xml"
  install -Dm644 "${srcdir}/db4s-sqbpro.xml" "${pkgdir}/usr/share/mime/packages/db4s-sqbpro.xml"
  install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
