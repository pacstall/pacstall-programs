name="flatpak-git"
pkgname="flatpak"
repology=("project: ${pkgname}")
build_depends="libtool git autoconf automake"
depends="libseccomp-dev appstream libjson-glib-dev bison ostree libarchive-dev gobject-introspection gtk-doc-tools gettext libpcap-dev libxau-dev mate-polkit libgpgme-dev libsoup-gnome2.4-dev libxml2-dev"
breaks="${pkgname}-bin"
replace="${pkgname}"
url="https://github.com/${pkgname}/${pkgname}.git"
description="Linux application sandboxing and distribution framework"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

pkgver() {
  git ls-remote "${url}" main | cut -f1
}
version="$(pkgver)"

prepare() {
  ./autogen.sh
}

build() {
  ./configure
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="/usr/src/pacstall/${pkgname}"
}

postinst() {
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}
