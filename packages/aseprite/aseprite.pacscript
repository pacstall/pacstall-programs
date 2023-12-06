# Based on the PKGBUILD from the AUR:
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=aseprite
# Credit to the listed maintainers & contributors

name="aseprite"
pkgver="1.3.2"
pkgdesc="Animated sprite editor & pixel art tool"
repology=("project: ${name}")
homepage="https://www.aseprite.org/"
makedepends=("clang" "cmake" "libc++-dev" "libc++abi-dev" "libfontconfig1-dev" "libgl1-mesa-dev" "ninja-build" "xorg-dev")
depends=("hicolor-icon-theme")
arch=("amd64")
maintainer="vigress8 <vig@disroot.org>"
url="https://github.com/${name}/${name}/releases/download/v${pkgver}/Aseprite-v${pkgver}-Source.zip"
hash="0246b18ff77d4c4e813c7f40207bfbd1387813b82d57900cde869dab370a26cc"
skiaver="m102-861e4743af"
skiaurl="https://github.com/${name}/skia/releases/download/${skiaver}/Skia-Linux-Release-x64-libc++.zip"
skiahash="66293c15aa773a96121afb01f09109d3e5d455a6fd51944e0bb8bdc0829913ea"
patch=("https://aur.archlinux.org/cgit/aur.git/plain/desktop.patch?h=aseprite")

prepare() {
  wget -q "${skiaurl}"
  if [[ $(sha256sum "Skia-Linux-Release-x64-libc++.zip" | cut -d' ' -f1) != "${skiahash}" ]]; then
    fancy_message error "Could not verify integrity of Skia-Linux-Release-x64-libc++.zip"
    return 1;
  fi
  unzip -qq "Skia-Linux-Release-x64-libc++.zip" -d skia

  # Apply patch from AUR
  patch -stp1 <PACSTALL_patchesdir/"desktop.patch?h=aseprite"
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
    -DSKIA_DIR=../skia \
    -DSKIA_LIBRARY_DIR=../skia/out/Release-x64 \
    -DSKIA_LIBRARY=../skia/out/Release-x64/libskia.a \
    -G Ninja \
    -Wno-dev \
    ..
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

pre_install() {
  fancy_message warn "Aseprite is non-free software. Distributing the binary files produced by this script is forbidden. For more information, read Aseprite's EULA:
  https://github.com/${name}/${name}/blob/main/EULA.txt"
}
