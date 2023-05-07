name="rhino-pkg-git"
url="https://github.com/rhino-linux/rhino-pkg.git"
gives="rhino-pkg"
build_depends=("make" "gettext")
depends=("gettext")
description="Rhino-pkg wrapper script"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

install() {
  sudo DESTDIR="${pkgdir}" make install
}

postinst() {
  sudo ln -sf "/usr/bin/rhino-pkg" "/usr/bin/rpk"
}

removescript() {
  sudo rm -f "/usr/bin/rpk"
}
