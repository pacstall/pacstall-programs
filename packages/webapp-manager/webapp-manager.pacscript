name="webapp-manager"
version="1.3.0"
build_depends=("gettext")
depends=("gir1.2-xapp-1.0" "python3" "python3-bs4" "python3-configobj" "python3-gi" "python3-setproctitle" "python3-tldextract" "xapps-common" "python3-pil" "libglib2.0-bin")
description="Run websites as if they were apps"
repology=("project: webapp-manager")
hash="8188846ea644a69b143b573dcd5d1c1472d0e968996fb3d3bb1ce6b1ead81658"
incompatible=("*:jammy")
url="https://github.com/linuxmint/webapp-manager/archive/refs/tags/${version}.tar.gz"
maintainer="Zahrun <Zahrun@github.com>"

prepare() {
  # Silent build
  sed -i 's/@echo/#/g' Makefile
  # Fix typo
  sed -i 's/range(4)/range(5)/g' "usr/lib/${name}/common.py"
  # Fix desktop file
  mv usr/share/applications/kde4/webapp-manager.desktop usr/share/applications/webapp-manager-kde.desktop
}

build() {
  make all -s
}

install() {
  sudo mkdir -p "${pkgdir}"
  sudo cp -r usr etc "${pkgdir}"
}

postinst() {
  sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
}
