# Based on the PKGBUILD from the AUR:
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=aseprite
# Credit to the listed maintainers & contributors

name="aseprite"
pkgver="1.3.5"
pkgdesc="Animated sprite editor & pixel art tool"
repology=("project: ${name}")
homepage="https://www.aseprite.org/"
makedepends=("clang" "cmake" "libc++-dev" "libc++abi-dev" "libfontconfig1-dev" "libgl1-mesa-dev" "libxi-dev" "ninja-build" "xorg-dev")
depends=("hicolor-icon-theme")
arch=("amd64")
maintainer="vigress8 <vig@disroot.org>"
skiaver="m102-861e4743af"
source=(
  "https://github.com/${name}/${name}/releases/download/v${pkgver}/Aseprite-v${pkgver}-Source.zip"
  "skia.zip::https://github.com/${name}/skia/releases/download/${skiaver}/Skia-Linux-Release-x64-libc++.zip"
)
hash=(
  "6acf1b7f5019733cd8a54d8e0504e78b2f74cdb2073f82230e543cfd990f6984"
  "66293c15aa773a96121afb01f09109d3e5d455a6fd51944e0bb8bdc0829913ea"
)
noextract=("skia.zip")

prepare() {
  unzip -qq "skia.zip" -d skia
}

build() {
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
  sudo cmake --install build --prefix="${pkgdir}/usr" --strip
  # Install the icons in the correct directory (which is not the default)
  local _size
  for _size in 16 32 48 64 128 256; do
    sudo install -Dm644 "${pkgdir}/usr/share/${name}/data/icons/ase${_size}.png" \
    -t "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
  done
  # Delete the icons to avoid copying them in two places (they aren't used by Aseprite itself)
  sudo rm -rf "${pkgdir}/usr/share/${name}/data/icons"
  # Install the licenses
  sudo install -Dm644 {EULA.txt,docs/LICENSES.md} -t "${pkgdir}/usr/share/licenses/${name}"
  sudo install -m644 "data/fonts/LICENSE.txt" "${pkgdir}/usr/share/licenses/${name}/font.txt"
}

post_install() {
  fancy_message warn "Aseprite is non-free software. Distributing the binary files produced by this script is forbidden. For more information, read Aseprite's EULA:
  https://github.com/${name}/${name}/blob/main/EULA.txt"
}
