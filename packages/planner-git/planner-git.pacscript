name="planner-git"
url="https://github.com/alainm23/planner.git"
build_depends=("meson" "ninja-build" "libgtk-3-dev" "libgee-0.8-dev" "libjson-glib-dev" "libsqlite3-dev" "libsoup2.4-dev" "libgranite-dev" "libwebkit2gtk-4.0-dev" "libecal2.0-dev" "libedataserver1.2-dev" "libpeas-dev" "libical-dev" "libhandy-1-dev")
depends=("libgtk-3-0" "libgee-0.8-2" "libjson-glib-1.0-0" "libjson-glib-1.0-common" "libsqlite3-0" "libsoup2.4-1" "libgranite5" "libgranite-common" "libwebkit2gtk-4.0-37" "libecal-2.0-1" "libedataserver-1.2-26" "libpeas-1.0-0" "libpeas-common" "libical3" "libhandy-1-0" "valac" "elementary-icon-theme" "libevolution")
description="Task manager with Todoist support designed for GNU/Linux"
maintainer="echometer <guacamolek@yandex.com>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  meson build --prefix="/usr"
  cd build
  ninja
}

install() {
  cd build
  sudo DESTDIR="${pkgdir}" ninja install
}
