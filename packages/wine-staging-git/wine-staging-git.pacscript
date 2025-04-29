pkgname="wine-staging-git"
gives="wine-staging-git"
pkgdesc="Compatibility layer for running Windows programs - Staging branch"
arch=("any")
pkgver="10.6"
url="https://www.wine-staging.com"
license=("LGPL-2.1-or-later")
maintainer=("xdavius <xdavius@github.com>")

source=(
  "git+https://gitlab.winehq.org/wine/wine-staging.git"
  "git+https://gitlab.winehq.org/wine/wine.git"
  "30-win32-aliases.conf::https://aur.archlinux.org/cgit/aur.git/plain/30-win32-aliases.conf?h=wine-git"
  "wine-binfmt.conf::https://aur.archlinux.org/cgit/aur.git/plain/wine-binfmt.conf?h=wine-git"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)

makedepends=(
  "devscripts" "autotools-dev" "autoconf" "libjpeg-turbo8-dev | libjpeg62-turbo-dev" "libjpeg-turbo8-dev:i386 | libjpeg62-turbo-dev:i386"
  "libasound2-dev" "libpulse-dev" "libdbus-1-dev" "libfontconfig-dev" "libfreetype-dev"
  "libgnutls28-dev" "libpng-dev" "libtiff-dev" "libgl-dev" "libunwind-dev"
  "libxml2-dev" "libxslt1-dev" "libfaudio-dev" "libgstreamer1.0-dev" "libgstreamer-plugins-base1.0-dev"
  "libmpg123-dev" "libjxr-dev" "libosmesa6-dev" "libsdl2-dev" "libudev-dev"
  "libvkd3d-dev" "libvulkan-dev" "gcc-mingw-w64" "gcc-multilib" "g++-multilib"
  "flex" "bison" "libx11-dev" "libx11-dev:i386" "xorg-dev"
  "libfreetype-dev:i386" "oss4-dev | alsa-oss" "libasound2-dev:i386" "libpulse-dev:i386" "libdbus-1-dev:i386"
  "libfontconfig-dev:i386" "libfreetype-dev:i386" "libgnutls28-dev:i386" "libpng-dev:i386" "libtiff-dev:i386"
  "libgl-dev:i386" "libunwind-dev:i386" "libxml2-dev:i386" "libxslt1-dev:i386" "libgstreamer1.0-dev:i386"
  "libmpg123-dev:i386" "libosmesa6-dev:i386" "libsdl2-dev:i386" "libudev-dev:i386" "libvulkan-dev:i386"
  "libx11-dev:i386" "libwayland-dev" "libwayland-dev:i386" "libxkbregistry-dev" "libxkbregistry-dev:i386"
)

depends=(
  "libjpeg-turbo8-dev | libjpeg62-turbo-dev" "libjpeg-turbo8-dev:i386 | libjpeg62-turbo-dev:i386" "libasound2-dev" "libpulse-dev" "libdbus-1-dev"
  "libfontconfig-dev" "libfreetype-dev" "libgnutls28-dev" "libpng-dev" "libtiff-dev"
  "libgl-dev" "libunwind-dev" "libxml2-dev" "libxslt1-dev" "libfaudio-dev"
  "libgstreamer1.0-dev" "libgstreamer-plugins-base1.0-dev" "libmpg123-dev" "libjxr-dev" "libosmesa6-dev"
  "libsdl2-dev" "libudev-dev" "libvkd3d-dev" "libvulkan-dev" "libx11-dev"
  "libx11-dev:i386" "xorg-dev" "libfreetype-dev:i386" "oss4-dev | alsa-oss" "libasound2-dev:i386"
  "libpulse-dev:i386" "libdbus-1-dev:i386" "libfontconfig-dev:i386" "libfreetype-dev:i386" "libgnutls28-dev:i386"
  "libpng-dev:i386" "libtiff-dev:i386" "libgl-dev:i386" "libunwind-dev:i386" "libxml2-dev:i386"
  "libxslt1-dev:i386" "libgstreamer1.0-dev:i386" "libmpg123-dev:i386" "libosmesa6-dev:i386" "libsdl2-dev:i386"
  "libudev-dev:i386" "libvulkan-dev:i386" "libx11-dev:i386"
)

conflicts=("wine-staging" "wine" "wine64" "wine32:i386" "libwine" "libwine:i386" "wine-staging-i386:i386" "fonts-wine")

optdepends=("liblcms2-dev: color management"
  "libcups2-dev: printing support"
  "libgphoto2-dev: still image support"
  "libsane-dev: scanning support"
  "libgsm1-dev: GSM audio codec"
  "libldap2-dev: LDAP support"
  "samba-dev: SMB support"
  "ocl-icd-opencl-dev: opencl support"
  "libusb-1.0-0-dev: USB support"
  "libv4l-dev: video capture support"
  "liblcms2-dev:i386: 32-bit color management"
  "libcups2-dev:i386: 32-bit printing support"
  "libgphoto2-dev:i386: 32-bit still image support"
  "libsane-dev:i386: 32-bit scanning support"
  "libgsm1-dev:i386: 32-bit GSM audio codec"
  "libldap2-dev:i386: 32-bit LDAP support"
  "samba-dev:i386: 32-bit SMB support"
  "ocl-icd-opencl-dev:i386: 32-bit opencl support"
  "libusb-1.0-0-dev:i386: 32-bit USB support"
  "libv4l-dev:i386: 32-bit video capture support")

prepare() {
  cd "${srcdir}"/wine
  rm -rf build-{32,64}
  mkdir -p wine64-build
  mkdir -p wine32-build

  # restore the wine tree to its git origin state, without wine-staging patches
  printf '%s\n' '  -> Cleaning wine source code tree...'
  git -C wine reset --hard HEAD # restore tracked files
  git -C wine clean -xdf        # delete untracked files

  # change back to the wine upstream commit that this version of wine-staging is based in
  printf '%s\n' '  -> Changing wine HEAD to the wine-staging base commit...'
  git -C wine config --local advice.detachedHead false
  git -C wine checkout "$(wine-staging/staging/patchinstall.py --upstream-commit)"

  cd "${srcdir}"

  # apply all wine-staging patches
  printf '%s\n' '  -> Applying wine-staging patches...'
  wine-staging/staging/patchinstall.py DESTDIR="${srcdir}/wine" --all

}

build() {
  export CFLAGS="${CFLAGS} -ffat-lto-objects"
  export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/lib/i386-linux-gnu/pkgconfig:/usr/lib32/pkgconfig"
  cd "${srcdir}"/wine
  ls -l
  cd "wine64-build"
  ../configure \
    --prefix='/usr' \
    --libdir='/usr/lib' \
    --with-x \
    --with-wayland \
    --with-gstreamer \
    --enable-win64
  make -j"${NCPU}"

  cd "../wine32-build"
  ../configure \
    --prefix='/usr' \
    --libdir='/usr/lib' \
    --with-x \
    --with-wayland \
    --with-gstreamer \
    --with-wine64="../wine64-build"
  make -j"${NCPU}"
}

package() {
  cd "${srcdir}"/wine
  cd "wine32-build"
  mkdir -p "${pkgdir}/usr/lib/wine"
  make prefix="${pkgdir}/usr" \
    libdir="${pkgdir}/usr/lib" \
    dlldir="${pkgdir}/usr/lib/wine" \
    install
  cd "../wine64-build"
  mkdir -p "${pkgdir}/usr/lib/wine"
  make prefix="${pkgdir}/usr" \
    libdir="${pkgdir}/usr/lib" \
    dlldir="${pkgdir}/usr/lib/wine" \
    install

  install -d -m755 "${pkgdir}/usr/share/fontconfig/conf.default"
  install -D -m644 "${srcdir}/30-win32-aliases.conf" "${pkgdir}/usr/share/fontconfig/conf.avail/30-win32-aliases.conf"
  install -D -m644 "${srcdir}/30-win32-aliases.conf" "${pkgdir}/usr/share/fontconfig/conf.default/30-win32-aliases.conf"

  install -D -m644 "${srcdir}/wine-binfmt.conf" "${pkgdir}/usr/lib/binfmt.d/wine.conf"

  i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/usr/lib/wine/i386-windows"/*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "${pkgdir}/usr/lib/wine/x86_64-windows"/*.dll
}
