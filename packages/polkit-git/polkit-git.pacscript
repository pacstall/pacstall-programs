name="polkit-git"
pkgname="polkit"
gives="polkit"
build_depends="autoconf automake libtool"
depends="gtk-doc-tools libmozjs-91-dev autopoint libglib2.0-dev gir1.2-gmodule-2.0"
url="https://gitlab.freedesktop.org/${pkgname}/${pkgname}.git"
description="polkit is a toolkit for defining and handling authorizations. It is used for allowing unprivileged processes to speak to privileged processes"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1
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
  sudo make install DESTDIR="${STOWDIR}/${pkgname}"
}
