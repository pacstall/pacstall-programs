pkgname="plank-reloaded"
arch=("any")
pkgver="0.11.169"
provides=("plank")
replaces=("plank")
conflicts=("plank" "libplank-common" "libplank1")
pkgdesc="Elegant and simple dock"
url='https://github.com/zquestz/plank-reloaded'
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: ${pkgname}")
source=("https://github.com/zquestz/plank-reloaded/archive/refs/tags/${pkgver}.tar.gz")
sha256sum=("8beb003b03370273b7329fa6e3633eb213288e9676360e70e8a855bb84438c81")
makedepends=(
  "git"
  "cmake"
  "gettext"
  "desktop-file-utils"
  "libdbusmenu-glib-dev"
  "libdbusmenu-gtk3-dev"
  "meson"
  "ninja-build"
  "valac"
  "libgnome-menu-3-dev"
  "libxml2-utils"
  "libgtk-3-dev"
  "libgee-0.8-dev"
  "libbamf3-dev"
  "libwnck-3-dev"
  "libcanberra-dev"
  "libxi-dev"
  "libxfixes-dev"
  "build-essential"
  "pkg-config")
depends=("bamfdaemon" "libgee-0.8-2" "libgnome-menu-3-0" "libwnck-3-0" "libcanberra0t64 | libcanberra0" "libc6")

prepare() {
  cd "plank-reloaded-${pkgver}"
  meson setup --prefix=/usr build
  meson configure build -D enable-apport=false -D production-release=true
}

build() {
  cd "plank-reloaded-${pkgver}"
  meson compile -C build
}

package() {
  cd "plank-reloaded-${pkgver}"
  meson install --destdir="${pkgdir}" -C build
}
