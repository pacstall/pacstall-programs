name="webapp-manager"
version="1.3.2"
build_depends=("gettext")
depends=("gir1.2-xapp-1.0" "python3" "python3-bs4" "python3-configobj" "python3-gi" "python3-setproctitle" "python3-tldextract" "xapps-common" "python3-pil" "libglib2.0-bin")
description="Run websites as if they were apps"
repology=("project: webapp-manager")
hash="42fff2dd90ebb24669cc4ca4dec36e05c46ac8c112d2b3fd05b1f8babdf05b8d"
incompatible=("*:jammy" "*:bullseye")
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
