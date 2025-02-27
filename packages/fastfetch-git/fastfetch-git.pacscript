#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="fastfetch-git"
gives="fastfetch"
pkgdesc="Like neofetch, but much faster because written in c"
source=("https://github.com/LinusDierheimer/fastfetch.git")
arch=("any")
license=("MIT")
pkgver="2.37.0"
repology=("project: ${gives}")
checkdepends=("cmake")
makedepends=("cmake>=3.12" "pkg-config" "python3" "libvulkan-dev" "libwayland-dev" "libxcb-randr0-dev" "libxrandr-dev" "libdrm-dev" "libdconf-dev" "zlib1g-dev" "libchafa-dev" "libxfconf-0-dev" "libdbus-1-dev" "libmagickcore-dev" "libegl-dev" "libosmesa6-dev" "ocl-icd-opencl-dev" "libpulse-dev" "libddcutil-dev" "libelf-dev")
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app")

build() {
  cmake -B build -S "fastfetch" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_FLASHFETCH='OFF' \
    -DBUILD_TESTS='ON' \
    -DENABLE_SQLITE3='OFF' \
    -DENABLE_RPM='OFF' \
    -DENABLE_IMAGEMAGICK6='ON' \
    -DENABLE_IMAGEMAGICK7='OFF' \
    -DENABLE_SYSTEM_YYJSON='OFF' \
    -DENABLE_DIRECTX_HEADERS='OFF' \
    -DPACKAGES_DISABLE_APK='ON' \
    -DPACKAGES_DISABLE_EMERGE='ON' \
    -DPACKAGES_DISABLE_EOPKG='ON' \
    -DPACKAGES_DISABLE_GUIX='ON' \
    -DPACKAGES_DISABLE_LINGLONG='ON' \
    -DPACKAGES_DISABLE_LPKG='ON' \
    -DPACKAGES_DISABLE_LPKGBUILD='ON' \
    -DPACKAGES_DISABLE_OPKG='ON' \
    -DPACKAGES_DISABLE_PALUDIS='ON' \
    -DPACKAGES_DISABLE_PKG='ON' \
    -DPACKAGES_DISABLE_PKGTOOL='ON' \
    -DPACKAGES_DISABLE_RPM='ON' \
    -DPACKAGES_DISABLE_SORCERY='ON' \
    -DPACKAGES_DISABLE_XBPS='ON' \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
# vim:set ft=sh ts=2 sw=2 et:
