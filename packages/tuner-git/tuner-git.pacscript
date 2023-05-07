name="tuner-git"
license="GPL-3.0"
url="https://github.com/louis77/tuner.git"
build_depends=("meson" "valac" "libgtk-3-dev" "libgranite-dev" "libsoup2.4-dev" "libgstreamer1.0-dev" "libgstreamer-plugins-bad1.0-dev" "libjson-glib-dev" "libgee-0.8-dev" "libgeocode-glib-dev" "libgeoclue-2-dev" "libgeocode-glib-dev")
depends=("desktop-file-utils")
replace=("tuner")
description="Tuner Radio Player - development version"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b github . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  meson builddir --prefix=/usr
}

build() {
  ninja -C builddir -j"$(nproc)"
}

install() {
  sudo DESTDIR="${pkgdir}" ninja -C builddir install
}

postinst() {
  sudo glib-compile-schemas /usr/share/glib-2.0/schemas
  sudo update-desktop-database -q /usr/share/applications
  sudo gtk-update-icon-cache -qtf /usr/share/icons/hicolor
}

removescript() {
  sudo update-desktop-database -q /usr/share/applications
}
