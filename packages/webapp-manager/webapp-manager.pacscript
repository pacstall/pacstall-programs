name="webapp-manager"
version="1.1.9"
url="https://github.com/linuxmint/webapp-manager/archive/refs/tags/$version.tar.gz"
build_depends="gettext"
depends="gir1.2-xapp-1.0 python3 python3-bs4 python3-configobj python3-gi python3-setproctitle python3-tldextract xapps-common python3-pil"
description="Run websites as if they were apps"
repology=("project: webapp-manager")
hash="a4e2f687e48f90823b3d012486a2fb925f9954fbc3974c90462a5097c1549edf"
maintainer="Zahrun <Zahrun@github.com>"
prepare() {
  # Silent build
  sed -i 's/@echo/#/g' Makefile
  # Fix typo
  sed -i 's/range(4)/range(5)/g' "usr/lib/$name/common.py"
  # Fix desktop file
  mv usr/share/applications/kde4/webapp-manager.desktop usr/share/applications/webapp-manager-kde.desktop
}

build() {
  make all -s
}

install() {
  installdir=/usr/src/pacstall/webapp-manager
  sudo mkdir -p $installdir
  sudo cp -r usr etc $installdir
}

postinst() {
  sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
}
