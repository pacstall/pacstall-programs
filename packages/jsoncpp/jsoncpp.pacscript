pkgname="jsoncpp"
gives="libjsoncpp-dev"
provides=("libjsoncpp25")
replaces=("${provides[@]}")
conflicts=("${provides[@]}")
pkgver="1.9.5"
pkgdesc='C++ library for interacting with JSON'
url='https://github.com/open-source-parsers/jsoncpp'
arch=('x86_64')
license=('MIT')
makedepends=('doxygen' 'graphviz' 'python3' 'meson' 'ninja-build')
source=("https://github.com/open-source-parsers/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1d06e044759b1e1a4cc4960189dd7e001a0a4389d7239a6d59295af995a553518e4e0337b4b4b817e70da5d9731a4c98655af90791b6287870b5ff8d73ad8873')
maintainer=("xdavius <xdavius@github.com>")

prepare() {
  cd "${pkgname}-${pkgver}"
  echo "${pkgver}" > version
}

build() {
  cd "${pkgname}-${pkgver}"
  echo "Building shared library..."
  meson --prefix=/usr/local --default-library shared build
  ninja -C build

  echo "Building static library..."
  CXXFLAGS="${CXXFLAGS} -ffat-lto-objects" \
    meson --prefix=/usr/local --default-library static build-static
  ninja -C build-static

  echo "Building docs..."
  python3 doxybuild.py \
    --doxygen="$(command -v doxygen)" \
    --with-dot
}

check() {
  cd "${pkgname}-${pkgver}"
  ninja -C build test
  cd test
  python3 runjsontests.py ../build/jsontestrunner
  python3 rununittests.py ../build/jsoncpp_test
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  DESTDIR="${pkgdir}" ninja -C build-static install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a dist/doxygen/jsoncpp-api-html-"${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/html"
}
