# Based on the PKGBUILD from the AUR:
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=aseprite
# Credit to the listed maintainers & contributors

pkgname="aseprite"
pkgver="1.3.9"
pkgdesc="Animated sprite editor & pixel art tool"
license=("custom:EULA")
repology=("project: ${pkgname}")
url="https://www.aseprite.org/"
makedepends=("clang" "cmake" "libc++-dev" "libc++abi-dev" "libfontconfig1-dev" "libgl1-mesa-dev" "libx11-dev" "libxcursor-dev" "libxi-dev" "ninja-build")
arch=("amd64")
maintainer=()
skiaver="m102-861e4743af"
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/Aseprite-v${pkgver}-Source.zip"
  "skia-${skiaver}.zip::https://github.com/${pkgname}/skia/releases/download/${skiaver}/Skia-Linux-Release-x64-libc++.zip"
  "https://github.com/${pkgname}/strings.git"
)
sha256sums=(
  "672c8ddb12d4c180f6c27b33ec4b0faefe5df321c7d40c03cb62ad3182e584ff"
  "66293c15aa773a96121afb01f09109d3e5d455a6fd51944e0bb8bdc0829913ea"
  "SKIP"
)
noextract=(
  "${pkgname}-${pkgver}.zip"
  "skia-${skiaver}.zip"
)

prepare() {
  unzip -qq "${pkgname}-${pkgver}.zip" -d aseprite
  unzip -qq "skia-${skiaver}.zip" -d skia

  cd aseprite
  rm -rf data/strings
  mv ../strings data
}

build() {
  local cmake_flags=(
    -S aseprite
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_C_COMPILER=clang
    -D CMAKE_CXX_COMPILER=clang++
    -D CMAKE_CXX_FLAGS=-stdlib=libc++
    -D CMAKE_EXE_LINKER_FLAGS=-stdlib=libc++
    -D CMAKE_INSTALL_MESSAGE=NEVER
    # Known to install bogus files which conflict with many packages,
    # so contain them in a separate place.
    -D CMAKE_INSTALL_PREFIX=/opt/aseprite
    -D ENABLE_DESKTOP_INTEGRATION=ON
    -D ENABLE_PSD=ON
    -D ENABLE_UPDATER=OFF
    -D FETCHCONTENT_FULLY_DISCONNECTED=ON
    -D LAF_BACKEND=skia
    -D LAF_WITH_EXAMPLES=OFF
    -D LAF_WITH_TESTS=OFF
    -D SKIA_DIR=skia
    -D SKIA_LIBRARY_DIR=skia/out/Release-x64
    -G Ninja
    -W no-dev
  )

  cmake "${cmake_flags[@]}"
  cmake --build build -j"${NCPU}"
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --strip

  install -dm644 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin"

  # Install the icons in the correct directory (which is not the default)
  local dst size src="${pkgdir}/opt/${pkgname}/share/${pkgname}/data/icons"
  for size in 16 32 48 64 128 256; do
    dst="${pkgdir}/usr/share/icons/hicolor/${size}x${size}"
    install -Dm644 "${src}/ase${size}.png" "${dst}/apps/${pkgname}.png"
    install -Dm644 "${src}/doc${size}.png" "${dst}/mimetypes/image-x-${pkgname}.png"
  done

  # Delete the icons to avoid copying them in two places (they aren't used by Aseprite itself)
  rm -rf "${src}"

  find "${pkgdir}/opt/${pkgname}" -name '*.desktop' \
    -exec install -Dm644 -t "${pkgdir}/usr/share/applications" '{}' +

  cd aseprite
  # Install the licenses
  install -Dm644 EULA.txt docs/LICENSES.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "data/fonts/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/font.txt"
}

pre_install() {
  fancy_message warn "Aseprite is non-free software. Distributing the binary files produced by this script is forbidden. For more information, read Aseprite's EULA:
  https://github.com/${pkgname}/${pkgname}/blob/main/EULA.txt"
}
