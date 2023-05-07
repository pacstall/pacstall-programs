name="i3blocks-git"
pkgname="i3blocks"
description="A feed generator for text based status bars"
url="https://github.com/vivien/${pkgname}.git"
build_depends=("autoconf" "gcc" "make" "pkgconf")
breaks=("${pkgname}")
maintainer="Lanius <laniusone@pm.me>"

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && echo "$(git log --format=%ct.%h)" && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  ./autogen.sh && ./configure
}

build() {
  make -j"$(nproc)"
}

install() {
  # Install i3blocks
  sudo make install DESTDIR="${pkgdir}"
}
