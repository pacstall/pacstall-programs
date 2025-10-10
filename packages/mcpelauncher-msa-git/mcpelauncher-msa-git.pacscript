pkgname=mcpelauncher-msa-git
gives='mcpelauncher-msa'
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
  'git+https://github.com/minecraft-linux/msa-manifest.git'
  'git+https://github.com/minecraft-linux/logger.git'
  'git+https://github.com/minecraft-linux/base64.git'
  'git+https://github.com/minecraft-linux/file-util.git'
  'git+https://github.com/minecraft-linux/arg-parser.git'
  'git+https://github.com/minecraft-linux/rapidxml.git'
  'git+https://github.com/MCMrARM/simple-ipc.git'
  'git+https://github.com/minecraft-linux/daemon-utils.git'
  'git+https://github.com/minecraft-linux/msa.git'
  'git+https://github.com/minecraft-linux/msa-daemon.git'
  'git+https://github.com/minecraft-linux/msa-daemon-client.git'
  'nlohmann_json_license.txt::https://raw.githubusercontent.com/nlohmann/json/develop/LICENSE.MIT'
)

prepare() {
  cd "$srcdir/msa-manifest"
  git submodule init
  for submodule in {logger,base64,file-util,arg-parser,rapidxml,simple-ipc,daemon-utils,msa,msa-daemon,msa-daemon-client,msa-ui-gtk,msa-ui-qt};
  do
  git config submodule.$submodule.url "$srcdir/$submodule"
  done
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir"

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
