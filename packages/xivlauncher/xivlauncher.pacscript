pkgname="xivlauncher"
repology=("project: xivauncher.core")
pkgver="1.3.1"
pkgdesc="Custom Launcher for Final Fantasy XIV Online (Crossplatform rewrite)"
arch=('amd64')
url='https://github.com/goatcorp/XIVLauncher.Core/'
license=('GPL-3.0')
depends=(
  'build-essential'
  'aria2'
  'libsdl2-2.0-0'
  'libsecret-1-0'
  'attr'
  'fontconfig'
  'liblcms2-2'
  'libxml2'
  'libxcursor1'
  'libxrandr2'
  'libxdamage1'
  'gettext'
  'libfreetype6'
  'libglu1-mesa'
  'libsm6'
  'libpcap0.8'
  'libfaudio0'
  'desktop-file-utils'
  'libjxr0'
  'xdg-utils'
)
makedepends=("dotnet-sdk-10.0" "git")
optdepends=(
  'steam: If you have a Steam Service Account'
)
provides=("xivlauncher")
maintainer=("XIVLauncher Linux Maintainers <franz@goat.place>")
conflicts=(
  "xivlauncher-bin"
  "xivlauncher-git"
)
source=(
  "XIVLauncher.Core::git+https://github.com/goatcorp/XIVLauncher.Core.git#tag=${pkgver}"
  "XIVLauncher.desktop"
  "xivlauncher-core"
)
sha512sums=(
  'SKIP'
  'c06130b67efff8aa53760cb9c8bd764d4307624ec42c52d58cce388863e64788821f6f836857f200452e75de3b5311466074c70b81ad6d70ab60b286ddfda2e8'
  '1b4584216828fac294d9955924a89bba716bcb6f1ec582e50f3169e1501eb3d637cb89f921d887d8aba20eb4a4166915e9812aad634bcfd10ab97324164aaec5'
)

prepare() {
  cd "${srcdir}/XIVLauncher.Core"
  git submodule update --init --recursive
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/XIVLauncher.Core/src/XIVLauncher.Core/"
  echo "dotnet publish -r linux-x64 --sc -o \"${srcdir}/build\" --configuration Release -p:BuildHash=$(git rev-parse --short HEAD)"
  dotnet publish -r linux-x64 --sc -o "${srcdir}/build" --configuration Release -p:BuildHash="$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/opt/XIVLauncher/"
  install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
  install -D -m644 "${srcdir}/XIVLauncher.Core/misc/linux_distrib/512.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
  cp -r "${srcdir}/build/." "${pkgdir}/opt/XIVLauncher/"
  ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
  install -D -m755 "${srcdir}/xivlauncher-core" "${pkgdir}/usr/bin/xivlauncher-core"
}
