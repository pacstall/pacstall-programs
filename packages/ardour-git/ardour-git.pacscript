maintainer=("echometerain <echometer@disroot.org>")
# Author: David Runge <dvzrv@archlinux.org>

pkgname="ardour-git"
pkgdesc="Professional-grade digital audio workstation"
depends=("alsa-utils" "libqm-dsp0" "libcairo2" "libgcc-s1" "libglib2.0-0" "libglibmm-2.4-1v5" "libgtkmm-2.4-1v5" "libx11-6" "libxml2" "libsoundtouch1" "libtag1v5" "libflac8" "libasound2" "libatkmm-1.6-1v5" "libaubio5" "libarchive13" "libcairomm-1.0-1v5" "libcurl4" "libdbus-1-3" "libfftw3-3" "fontconfig" "libfreetype6" "libgdk-pixbuf-2.0-0" "libgtk2.0-0" "libgio-cil" "libglib2.0-cil" "libglib2.0-0" "libcairo-gobject2" "jackd2" "liblo7" "liblilv-0-0" "libltc11" "libogg0" "libpango-1.0-0" "libpangocairo-1.0-0" "libpangoft2-1.0-0" "libpangomm-1.4-1v5" "libpulse0" "libreadline8" "librubberband2" "libsamplerate0" "libserd-0-0" "libsndfile1" "libsord-0-0" "libsratom-0-0" "libsuil-0-0" "libusb-1.0-0" "libvamp-hostsdk3v5" "libvamp-sdk2v5" "libwebsockets-dev" "fluidsynth")
makedepends=("python3" "python-is-python3" "libgio2.0-cil-dev" "python3" "libqm-dsp-dev" "libcairo2-dev" "libglib2.0-dev" "libglibmm-2.4-dev" "libgtkmm-2.4-dev" "libx11-dev" "libxml2-dev" "libsoundtouch-dev" "libtag1-dev" "libatkmm-1.6-dev" "libaubio-dev" "libboost-all-dev" "libcairomm-1.0-dev" "libcppunit-dev" "libdbus-1-dev" "doxygen" "libfftw3-dev" "libflac-dev" "libfontconfig-dev" "libfreetype6-dev" "libgdk-pixbuf2.0-0" "graphviz" "libgtk2.0-dev" "libhidapi-dev" "itstool" "libjack-jackd2-dev" "libarchive-dev" "liblo-dev" "libltc-dev" "libogg-dev" "libpulse-dev" "libsamplerate0-dev" "libsndfile1-dev" "libusb-1.0-0-dev" "libwebsockets-dev" "liblilv-dev" "lv2-dev" "libpango1.0-dev" "libpangomm-1.4-dev" "libreadline-dev" "librubberband-dev" "libserd-dev" "libsord-dev" "libsratom-dev" "libsuil-dev" "vamp-plugin-sdk" "libfluidsynth-dev" "liblrdf0-dev" "libraptor2-dev" "libcurl4-gnutls-dev" "libasound2-dev")
optdepends=("xjadeo: video monitoring"
  "harvid: video timeline"
  "linuxaudio-new-session-manager: for session management")
provides=("ladspa-host" "lv2-host" "vst-host" "vst3-host" "ardour" "ardour-data")
breaks="ardour"
source=("https://github.com/Ardour/ardour.git")
arch=("any")
pkgver="7.5"
# patch="https://github.com/archlinux/svntogit-community/blob/packages/ardour/trunk/ardour-6.2-vendor_qm-dsp.patch"

prepare() {
  cd "ardour"
  # Patch uses vendored version of qm-dsp because qm-dsp >= 1.8.0 is not compatible
  # will be applied when ubuntu starts supporting qm-dsp 1.8.0
  # unsetting gtk2 rc (FS#54389)
  sed -e '8iexport GTK2_RC_FILES=/dev/null' -i "gtk2_ardour/ardour.sh.in"
}

build() {
  cd "ardour"
  # export LINKFLAGS="$LDFLAGS"
  ./waf configure --prefix=/usr \
    --configdir=/etc \
    --cxx11 \
    --freedesktop \
    --lxvst \
    --nls \
    --no-phone-home \
    --optimize \
    --ptformat \
    --use-external-libs \
    --with-backends="alsa,dummy,jack,pulseaudio"
  ./waf build -v
}

package() {
  cd "ardour"
  ./waf i18n --destdir="${pkgdir}"
  ./waf install --destdir="${pkgdir}"

  wait

  # man pages
  install -vDm 644 "./ardour.1" -t "${pkgdir}/usr/share/man/man1/"

  # File types
  install -vDm 644 "./build/gtk2_ardour/ardour.xml" -t "${pkgdir}/usr/share/mime/packages/"

  # Icons
  for size in 16 22 32 48; do
    install -vdm 755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    install -vDm 644 "${pkgdir}/usr/share/ardour7/icons/application-x-ardour_${size}px.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-ardour.png"
  done

  for size in 16 22 32 48 256 512; do
    install -vdm 755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    install -vDm 644 "${pkgdir}/usr/share/ardour7/resources/Ardour-icon_${size}px.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/ardour.png"
  done
}
