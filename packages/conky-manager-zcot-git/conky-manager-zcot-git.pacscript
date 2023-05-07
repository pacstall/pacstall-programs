name="conky-manager"
url="https://github.com/zcot/conky-manager2.git"
pkgver() {
  git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b add-1.10-support . # Returns the latest commit hash from remote
}
version="$(pkgver)"
build_depends=("valac" "libgee-0.8-dev" "libgtk-3-dev" "libjson-glib-dev" "gettext" "libgettextpo-dev" "p7zip-full" "imagemagick")
depends=("conky" "rsync")
description="Simple tool for managing Conky configs"

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
