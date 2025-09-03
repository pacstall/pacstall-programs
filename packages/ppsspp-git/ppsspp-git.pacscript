pkgname="ppsspp-git"
gives="ppsspp"
repology=("project: ppsspp")
arch=('amd64' 'arm64')
pkgver="1.19.3"
url='https://www.ppsspp.org'
source=("https://github.com/hrydgard/ppsspp.git")
makedepends=(
  "build-essential" "cmake" "libgl1-mesa-dev" libsdl2-dev libsdl2-ttf-dev
  "libfontconfig1-dev" "libvulkan-dev" "libglew-dev" "libwayland-dev" "libminiupnpc-dev"
  "libsnappy-dev" "libzip-dev" "libpng-dev" "libzstd-dev"
)
depends=(
  "libsnappy1v5" "libzstd1" "miniupnpc" "libglew2.2"
)
depends_jammy=("libzip4" "libpng16-16")
depends_noble=("libzip4t64" "libpng16-16t64")
depends_plucky=("libzip5" "libpng16-16t64")
depends_questing=("libzip5" "libpng16-16t64")
depends_bookworm=("libzip4" "libpng16-16")
conflicts=("${gives}-app")
replaces=("${gives}-app")
pkgdesc="PSP emulator"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-2.0-or-later')

prepare() {
  mkdir -p "${pkgdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/${gives}"
}

build() {
  _useSystemFfmpeg=OFF
  cd "${gives}"

  pushd "ffmpeg"
  case "${CARCH}" in
    "amd64")
      ./ffmpeg/linux_x86-64.sh
      ;;
    "arm64")
      ./ffmpeg/linux_arm64_native.sh
      ;;
    *)
      _useSystemFfmpeg=ON
      ;;
  esac

  popd
  mkdir -p build-sdl

  cmake -B build-sdl \
    -DCMAKE_BUILD_TYPE=Release \
    -DHEADLESS=ON \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DUSE_SYSTEM_LIBSDL2=OFF \
    -DUSE_SYSTEM_LIBPNG=ON \
    -DUSE_SYSTEM_ZSTD=ON \
    -DUSE_SYSTEM_MINIUPNPC=ON \
    -DUSE_SYSTEM_FFMPEG="${_useSystemFfmpeg}" \
    -DUSE_WAYLAND_WSI=ON \
    -DUSING_QT_UI=OFF

  cd build-sdl
  make -j"${NCPU}"
}

package() {
  cd "${gives}"
  install -Dm 755 build-sdl/PPSSPPSDL -t "${pkgdir}/usr/bin/"
  install -Dm 755 build-sdl/PPSSPPHeadless -t "${pkgdir}/usr/bin"

  cp -dr --no-preserve=ownership icons/hicolor "${pkgdir}/usr/share/icons"
  cp -dr --no-preserve=ownership build-sdl/assets "${pkgdir}/usr/share/${gives}"

  install -Dm 644 icons/icon-512.svg "${pkgdir}/usr/share/pixmaps/${gives}.svg"
  install -Dm 644 ppsspp.desktop.in "${pkgdir}/usr/share/applications/${gives}.desktop"

  desktop-file-edit \
    --set-key=Name --set-value="PPSSPP" \
    --set-key=Exec --set-value="PPSSPPSDL" \
    "${pkgdir}/usr/share/applications/${gives}.desktop"
}
