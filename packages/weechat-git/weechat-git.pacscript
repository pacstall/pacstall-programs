name="weechat-git"
pkgname="weechat"
url="https://github.com/weechat/weechat.git"
build_depends=("build-essential" "pkg-config" "g++")
depends=("libncursesw5-dev" "libcurl4-gnutls-dev" "libgcrypt20-dev" "libgnutls28-dev" "zlib1g-dev" "libzstd-dev" "gettext" "ca-certificates" "libaspell-dev" "python3-dev" "libperl-dev" "ruby-dev" "liblua5.4-dev" "tcl-dev" "guile-2.2-dev" "libv8-dev" "php-dev" "libphp-embed" "libxml2-dev" "libargon2-dev" "libsodium-dev" "asciidoctor" "ruby-pygments.rb" "libcpputest-dev")
replace=("${pkgname}-curses" "${pkgname}-plugins" "${pkgname}-python" "${pkgname}-perl" "${pkgname}-devel-curses" "${pkgname}-devel-plugins" "${pkgname}-devel-python" "${pkgname}-devel-perl")
breaks="${pkgname}-devel ${pkgname}"
description="Free chat client, fast and light, designed for many operating systems"

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
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
  sudo make install DESTDIR="${pkgdir}"
}
