name="wine-staging-git"
source=("https://github.com/wine-mirror/wine.git")
pkgver="8.13"
makedepends=("libasound2-dev" "libpulse-dev" "libdbus-1-dev" "libfontconfig-dev" "libfreetype-dev" "libgnutls28-dev" "libjpeg-turbo8-dev" "libpng-dev" "libtiff-dev" "libgl-dev" "libunwind-dev" "libxml2-dev" "libxslt1-dev" "libfaudio-dev" "libgstreamer1.0-dev" "libgstreamer-plugins-base1.0-dev" "libmpg123-dev" "libjxr-dev" "libosmesa6-dev" "libsdl2-dev" "libudev-dev" "libvkd3d-dev" "libvulkan-dev" "gcc-mingw-w64" "gcc-multilib" "g++-multilib" "flex" "bison" "libx11-dev" "libx11-dev:i386" "xorg-dev" "libfreetype-dev:i386" "oss4-dev" "libasound2-dev:i386" "libpulse-dev:i386" "libdbus-1-dev:i386" "libfontconfig-dev:i386" "libfreetype-dev:i386" "libgnutls28-dev:i386" "libjpeg-turbo8-dev:i386" "libpng-dev:i386" "libtiff-dev:i386" "libgl-dev:i386" "libunwind-dev:i386" "libxml2-dev:i386" "libxslt1-dev:i386" "libgstreamer1.0-dev:i386" "libmpg123-dev:i386" "libosmesa6-dev:i386" "libsdl2-dev:i386" "libudev-dev:i386" "libvulkan-dev:i386" "libx11-dev:i386")
depends=("software-properties-common" "debconf" "git-core" "libjpeg-turbo8:i386" "libasound2" "libasound2:i386" "libpulse0" "libpulse0:i386" "libdbus-1-3" "libdbus-1-3:i386" "libfontconfig1" "libfontconfig1:i386" "libfreetype6" "libfreetype6:i386" "libgnutls30" "libgnutls30:i386" "libpng-tools" "libpng16-16" "libpng16-16:i386" "libtiff5" "libtiff5:i386" "libgl1" "libgl1:i386" "libunwind8" "libunwind8:i386" "libxml2" "libxml2:i386" "libxml2-utils" "libxslt1.1" "libxslt1.1:i386" "libfaudio0" "libfaudio0:i386" "libgstreamer1.0-0" "libgstreamer1.0-0:i386" "libgstreamer-plugins-base1.0-0" "libgstreamer-plugins-base1.0-0:i386" "libmpg123-0" "libmpg123-0:i386" "libosmesa6" "libosmesa6:i386" "libsdl2-2.0-0" "libsdl2-2.0-0:i386" "libudev1" "libudev1:i386" "libvkd3d1" "libvkd3d1:i386" "libvulkan1" "libvulkan1:i386" "libjxr-tools" "libjxr0" "libx11-6" "libx11-6:i386" "xorg" "oss4-base")
breaks=("wine" "wine64" "wine32:i386" "libwine" "libwine:i386" "wine-staging-i386:i386")
replaces=("wine" "wine64" "wine32:i386" "libwine" "libwine:i386" "wine-staging-i386:i386")
pkgdesc="Wine is a program which allows running Microsoft Windows programs (including DOS, Windows 3.x, Win32, and Win64 executables) on Unix. It consists of a program loader which loads and executes a Microsoft Windows binary, and a library (called Winelib) that implements Windows API calls using their Unix, X11 or Mac equivalents.  The library may also be used for porting Windows code into native Unix executables."
optdepends=("libcapi20-dev: for ISDN software"
  "liblcms2-dev: color management"
  "libcups2-dev: printing support"
  "libgphoto2-dev: still image support"
  "libsane-dev: scanning support"
  "libgsm1-dev: GSM audio codec"
  "libkrb5-dev: kerberos authentication support"
  "libldap2-dev: LDAP support"
  "samba-dev: SMB support"
  "ocl-icd-opencl-dev: opencl support"
  "libpcap-dev: packet capture support"
  "libusb-1.0-0-dev: USB support"
  "libv4l-dev: video capture support"
  "libcapi20-dev:i386: for 32 bit ISDN software"
  "liblcms2-dev:i386: 32-bit color management"
  "libcups2-dev:i386: 32-bit printing support"
  "libgphoto2-dev:i386: 32-bit still image support"
  "libsane-dev:i386: 32-bit scanning support"
  "libgsm1-dev:i386: 32-bit GSM audio codec"
  "libkrb5-dev:i386: 32-bit kerberos authentication support"
  "libldap2-dev:i386: 32-bit LDAP support"
  "samba-dev:i386: 32-bit SMB support"
  "ocl-icd-opencl-dev:i386: 32-bit opencl support"
  "libpcap-dev:i386: 32-bit packet capture support"
  "libusb-1.0-0-dev:i386: 32-bit USB support"
  "libv4l-dev:i386: 32-bit video capture support")

# Translated from : https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=wine-git
# Original author : Daniel Bermond <dbermond@archlinux.org>
maintainer="echometerain <echometer@disroot.org>"

prepare() {
  export CFLAGS="${CFLAGS:-/-fno-plt/}"
  export LDFLAGS="${LDFLAGS:-/,-z,now/}"
  export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/lib/i386-linux-gnu/pkgconfig:/usr/lib32/pkgconfig"
  mkdir "wine64-build"
  mkdir "wine32-build"
  wget "http://mirrors.kernel.org/ubuntu/pool/main/g/gst-plugins-base1.0/libgstreamer-plugins-base1.0-dev_1.20.1-1_i386.deb"
  sudo apt install -y "./libgstreamer-plugins-base1.0-dev_1.20.1-1_i386.deb"
}

build() {
  cd "wine64-build"
  ../configure \
    --prefix='/usr' \
    --libdir='/usr/lib' \
    --with-x \
    --with-gstreamer \
    --enable-win64
  make -j"${NCPU}"

  cd "../wine32-build"
  ../configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --with-x \
    --with-gstreamer \
    --with-wine64="../wine64-build"
  make -j"${NCPU}"
  # shellcheck disable=SC2103
  cd ..
}

package() {
  cd "wine32-build"
  sudo mkdir -p "${pkgdir}/usr/lib32/wine"
  sudo make prefix="${pkgdir}/usr" \
    libdir="${pkgdir}/usr/lib32" \
    dlldir="${pkgdir}/usr/lib32/wine" \
    install
  cd "../wine64-build"
  sudo mkdir -p "${pkgdir}/usr/lib/wine"
  sudo make prefix="${pkgdir}/usr" \
    libdir="${pkgdir}/usr/lib" \
    dlldir="${pkgdir}/usr/lib/wine" \
    install

  sudo install -d -m755 "${pkgdir}/usr/share/fontconfig/conf.default"
  wget "https://aur.archlinux.org/cgit/aur.git/plain/30-win32-aliases.conf?h=wine-git" -O "./30-win32-aliases.conf"
  sudo install -D -m644 "./30-win32-aliases.conf" -t "${pkgdir}/usr/share/fontconfig/conf.avail"
  sudo install -D -m644 "./30-win32-aliases.conf" -t "${pkgdir}/usr/share/fontconfig/conf.default/30-win32-aliases.conf"

  wget "https://aur.archlinux.org/cgit/aur.git/plain/wine-binfmt.conf?h=wine-git" -O "./wine-binfmt.conf"
  sudo install -D -m644 "./wine-binfmt.conf" "${pkgdir}/usr/lib/binfmt.d/wine.conf"

  sudo i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/usr/lib32/wine/i386-windows"/*.dll
  sudo x86_64-w64-mingw32-strip --strip-unneeded "${pkgdir}/usr/lib/wine/x86_64-windows"/*.dll
}
