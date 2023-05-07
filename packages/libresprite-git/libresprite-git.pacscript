maintainer="echometerain <echometer@disroot.org>"
name=libresprite-git
description="fork of last GPL version of aseprite"
depends="libpixman-1-0 libcurl4 libgif7 zlib1g libpng16-16 libjpeg-turbo8 libwebp6 libxcursor1"
build_depends=("g++" "libx11-dev" "libxcursor-dev" "cmake" "ninja-build" "zlib1g-dev" "libpixman-1-dev" "libpng-dev" "libjpeg-turbo8-dev" "libtinyxml-dev" "libwebp-dev" "libgif-dev" "libgtest-dev" "libfreetype-dev" "libcurlpp-dev" "libharfbuzz-dev" "libsdl2-image-dev" "liblua5.3-dev")
url="https://github.com/LibreSprite/LibreSprite.git"
breaks=("aseprite" "libresprite-bin" "libresprite-app" "libresprite-deb" "libresprite")
gives="libresprite"

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  git fetch --all --tags --prune
  git submodule update --init --recursive
  mkdir build
}
build() {
  cd build
  cmake -G Ninja \
    -DWITH_DESKTOP_INTEGRATION=ON \
    -DUSE_SHARED_PIXMAN=ON \
    -DWITH_WEBP_SUPPORT=ON \
    -DUSE_SHARED_LIBWEBP=ON \
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_JPEGLIB=ON \
    -DZLIB_INCLUDE_DIR="/usr/include" \
    -DUSE_SHARED_ZLIB=ON \
    -DUSE_SHARED_LIBPNG=ON \
    -DUSE_SHARED_LIBLOADPNG=OFF \
    -DUSE_SHARED_TINYXML=ON \
    -DENABLE_UPDATER=OFF \
    -DUSE_SHARED_FREETYPE=ON \
    -DFREETYPE_INCLUDE_DIR="/usr/include/freetype2" \
    -DCMAKE_INSTALL_PREFIX:STRING="/usr" ..
  ninja libresprite
  # shellcheck disable=SC2103
  cd ..
}

install() {
  cd build
  sudo DESTDIR="${pkgdir}" ninja install
  # shellcheck disable=SC2103
  cd ..
}
