pkgname="wine-staging-git"
gives="wine-staging-git"
pkgdesc="Compatibility layer for running Windows programs - Staging branch"
arch=("any")
pkgver="10.11"
url='https://www.wine-staging.com'
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
  "flex" "bison" "libx11-dev" "xorg-dev" "oss4-dev | alsa-oss | oss-compat" "libwayland-dev" "libxkbregistry-dev"
)

depends=(
  "libjpeg-turbo8-dev | libjpeg62-turbo-dev" "libasound2-dev" "libpulse-dev" "libdbus-1-dev"
  "libfontconfig-dev" "libfreetype-dev" "libgnutls28-dev" "libpng-dev" "libtiff-dev"
  "libgl-dev" "libunwind-dev" "libxml2-dev" "libxslt1-dev" "libfaudio-dev"
  "libgstreamer1.0-dev" "libgstreamer-plugins-base1.0-dev" "libmpg123-dev" "libjxr-dev" "libosmesa6-dev"
  "libsdl2-dev" "libudev-dev" "libvkd3d-dev" "libvulkan-dev" "libx11-dev" "xorg-dev" "oss4-dev | alsa-oss | oss-compat"
)

conflicts=("wine-staging" "wine" "wine64" "libwine" "fonts-wine")

optdepends=("liblcms2-dev: color management"
  "libcups2-dev: printing support"
  "libgphoto2-dev: still image support"
  "libsane-dev: scanning support"
  "libgsm1-dev: GSM audio codec"
  "libldap2-dev: LDAP support"
  "samba-dev: SMB support"
  "ocl-icd-opencl-dev: opencl support"
  "libusb-1.0-0-dev: USB support"
  "libv4l-dev: video capture support")

prepare() {
  cd "${srcdir}"/wine
  mkdir -p wine64-build

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
    --enable-archs=i386,x86_64

  make -j"${NCPU}"
}

package() {
  cd "${srcdir}"/wine
  cd "wine64-build"
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
