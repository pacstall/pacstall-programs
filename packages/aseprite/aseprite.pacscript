# Based on the PKGBUILD from the AUR:
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=aseprite
# Credit to the listed maintainers & contributors

pkgname="aseprite"
pkgver="1.3.6"
pkgdesc="Animated sprite editor & pixel art tool"
repology=("project: ${pkgname}")
url="https://www.aseprite.org/"
makedepends=("clang" "cmake" "libc++-dev" "libc++abi-dev" "libfontconfig1-dev" "libgl1-mesa-dev" "libxi-dev" "ninja-build" "xorg-dev")
depends=("hicolor-icon-theme")
arch=("amd64")
maintainer=("vigress8 <vig@disroot.org>")
skiaver="m102-861e4743af"
source=(
  "https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/Aseprite-v${pkgver}-Source.zip"
  "https://github.com/${pkgname}/skia/releases/download/${skiaver}/Skia-Linux-Release-x64-libc++.zip"
)
sha256sums=(
  "5e974aa2786297981cd5ebe81f040a49b722bddfe33d70def207ad06cb0d34fc"
  "66293c15aa773a96121afb01f09109d3e5d455a6fd51944e0bb8bdc0829913ea"
)
noextract=("Skia-Linux-Release-x64-libc++.zip")

prepare() {
  cd "${_archive}"
  unzip -qq "${srcdir}/Skia-Linux-Release-x64-libc++.zip" -d skia
}

build() {
  cd "${_archive}"
  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  # Note: -DUSE_SHARED_* is not used since shared libraries cause headaches. If you wish to use them, copy the line below, choose the libraries you want shared and paste into the option list.
  # -DUSE_SHARED_{CMARK,CURL,FMT,FREETYPE,GIFLIB,HARFBUZZ,JPEGLIB,LIBARCHIVE,LIBPNG,PIXMAN,TINYXML,WEBP,ZLIB}=YES
  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_CXX_FLAGS:STRING=-stdlib=libc++ \
    -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++ \
    -DCMAKE_INSTALL_MESSAGE=NEVER \
    -DENABLE_{DESKTOP_INTEGRATION,PSD,SCRIPTING,WEBSOCKET}=ON \
    -DENABLE_UPDATER=OFF \
    -DLAF_BACKEND=skia \
    -DLAF_WITH_{EXAMPLES,TESTS}=OFF \
    -DSKIA_DIR=skia \
    -DSKIA_LIBRARY_DIR=skia/out/Release-x64 \
    -DSKIA_LIBRARY=skia/out/Release-x64/libskia.a \
    -G Ninja \
    -Wno-dev
  cmake --build build -j"${NCPU}"
}

package() {
  cd "${_archive}"
  cmake --install build --prefix="${pkgdir}/usr" --strip
  # Install the icons in the correct directory (which is not the default)
  local _size
  for _size in 16 32 48 64 128 256; do
    install -Dm644 "${pkgdir}/usr/share/${pkgname}/data/icons/ase${_size}.png" \
    -t "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
  done
  # Delete the icons to avoid copying them in two places (they aren't used by Aseprite itself)
  rm -rf "${pkgdir}/usr/share/${pkgname}/data/icons"
  # Install the licenses
  install -Dm644 {EULA.txt,docs/LICENSES.md} -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "data/fonts/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/font.txt"
}

pre_install() {
  fancy_message warn "Aseprite is non-free software. Distributing the binary files produced by this script is forbidden. For more information, read Aseprite's EULA:
  https://github.com/${pkgname}/${pkgname}/blob/main/EULA.txt"
}
