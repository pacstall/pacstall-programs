name="weechat-git"
gives="weechat"
url="https://github.com/weechat/weechat.git"
pkgver="4.0.2"
makedepends=("build-essential" "pkg-config" "g++")
depends=("libncursesw5-dev" "libcurl4-gnutls-dev" "libgcrypt20-dev" "libgnutls28-dev" "zlib1g-dev" "libzstd-dev" "gettext" "ca-certificates" "libaspell-dev" "python3-dev" "libperl-dev" "ruby-dev" "liblua5.4-dev" "tcl-dev" "guile-2.2-dev" "libv8-dev" "php-dev" "libphp-embed" "libxml2-dev" "libargon2-dev" "libsodium-dev" "asciidoctor" "ruby-pygments.rb" "libcpputest-dev")
replace=("${gives}-curses" "${gives}-plugins" "${gives}-python" "${gives}-perl" "${gives}-devel-curses" "${gives}-devel-plugins" "${gives}-devel-python" "${gives}-devel-perl")
breaks="${gives}-devel ${gives}"
pkgdesc="Free chat client, fast and light, designed for many operating systems"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  ./autogen.sh
}

build() {
  ./configure
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
