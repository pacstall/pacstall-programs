pkgname="bottles"
pkgver="52.0"
pkgdesc="Easily manage wine and proton prefixes"
arch=("amd64")
url='https://github.com/bottlesdevs/Bottles'
license=("GPL-3.0-only")
depends=(
  "cabextract"
  "hicolor-icon-theme"
  "icoextract"
  "imagemagick"
  "p7zip"
  "patool"
  "x11-utils"
  "libdconf1"
  "libgtk-4-1"
  "libgtksourceview-5-0"
  "libadwaita-1-0"
  "libhandy-1-0"
  "libportal-gtk4-1"
  "libwebkit2gtk-4.1-0"
  "gir1.2-adw-1"
  "gir1.2-gtksource-5"
  "gir1.2-xdp-1.0"
  "python3"
  "python3-chardet"
  "python3-gi"
  "python3-markdown"
  "python3-orjson"
  "python3-pathvalidate"
  "python3-pycurl"
  "python3-requests"
  "python3-yaml"
)
pacdeps=(
  "python3-fvs"
  "python3-vkbasalt-cli"
  # "python3-steamgriddb"
)
optdepends=(
  "gamemode: Game optimization"
  "gvfs: Userspace virtual filesystem"
  "gnutls-bin: GNU TLS library"
  "libvkd3d1: Direct3D 12 to Vulkan translation"
  # "wine: Wine Is Not Emulator"
)
makedepends=(
  "blueprint-compiler"
  "gettext"
  "desktop-file-utils"
  "appstream-util"
  "meson"
  "pkg-config"
  "cmake"
  "gobject-introspection"
  "libglib2.0-dev"
  "libgirepository1.0-dev"
  "libgtk-4-dev"
  "libadwaita-1-dev"
  "gir1.2-gtk-4.0"
)
# For testing and unstable until someone push python3-orjson
compatible=(
  "debian:trixie"
  "debian:sid"
  "ubuntu:oracular"
  "ubuntu:devel"
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  https://estudio-debian.pages.dev/static/resources/disable-flatpak-check.patch
)
sha256sums=(
  b684e9b1699351f40f345312404870916502e75c168fcbca11310effff23bb90
  012f00b6678ff20bb0a43c592c8f6b6af0d315053bf0473aa3f3b56c74845b73
)

build() {
  if [[ -d Bottles ]]; then
    rm -rf Bottles
  fi
  mv Bottles*/ Bottles/
  patch --forward --directory=Bottles --strip=1 --input=../disable-flatpak-check.patch
  cd "Bottles"
  meson --prefix="/usr" build
  ninja -C build -j"${NCPU}"
}

package() {
  cd "Bottles"
  DESTDIR="${pkgdir}" ninja -C build install
}
