pkgname=mcpelauncher-msa-git
gives='msa-manifest'
pkgver="0.9.0.r1.gcfcebaa"
pkgdesc="Microsoft Account authentication user interface (Qt) for the mcpelauncher-msa-daemon"
arch=('x86_64' 'i686')
url="https://github.com/minecraft-linux/msa-manifest"
license=('MIT')
makedepends=('git' 'cmake' 'ninja-build')
depends=('curl' 'openssl')
provides=('mcpelauncher-msa')
conflicts=('mcpelauncher-msa')
maintainer=("aKqir24 <aKqir24@github.com>")
source=(
  "https://github.com/minecraft-linux/${gives}.git"
  "https://raw.githubusercontent.com/nlohmann/json/develop/LICENSE.MIT"
)
external_connection=true
prepare() {
  cd "${gives}"
  git submodule update --init --recursive
  mkdir -p build
}

build() {
  cd "${gives}"
  cmake -S msa-manifest -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DENABLE_MSA_DAEMON=OFF \
    -DENABLE_MSA_QT_UI=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -Wno-dev

  cmake --build build --parallel "${NCPU}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "$srcdir/msa-manifest/msa-ui-qt/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/msa-manifest/msa-daemon-client/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 "$srcdir/nlohmann_json_license.txt" "I$pkgdir/usr/share/licenses/$pkgname/nlohmann_json_license.txt"
}
