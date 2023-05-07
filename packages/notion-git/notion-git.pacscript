name="notion-git"
pkgname="notion-git"
description="The notion window manager"
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://github.com/raboof/notion.git"
depends=("build-essential" "lua5.1" "liblua5.1-0-dev" "libx11-dev" "libxext-dev" "libsm-dev" "gettext" "libxinerama-dev" "libxrandr-dev" "libxft-dev")
gives="notion"
breaks=("notion")
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
