pkgname="weechat-git"
gives="weechat"
source=("https://github.com/weechat/weechat.git")
arch=("any")
pkgver="4.0.2"
makedepends=("build-essential" "pkg-config" "g++")
depends=("libncursesw5-dev" "libcurl4-gnutls-dev" "libgcrypt20-dev" "libgnutls28-dev" "zlib1g-dev" "libzstd-dev" "gettext" "ca-certificates" "libaspell-dev" "python3-dev" "libperl-dev" "ruby-dev" "liblua5.4-dev" "tcl-dev" "guile-2.2-dev" "libv8-dev" "php-dev" "libphp-embed" "libxml2-dev" "libargon2-dev" "libsodium-dev" "asciidoctor" "ruby-pygments.rb" "libcpputest-dev")
replaces=("${gives}-curses" "${gives}-plugins" "${gives}-python" "${gives}-perl" "${gives}-devel-curses" "${gives}-devel-plugins" "${gives}-devel-python" "${gives}-devel-perl")
breaks="${gives}-devel ${gives}"
pkgdesc="Free chat client, fast and light, designed for many operating systems"

prepare() {
  cd "weechat"
  ./autogen.sh
}

build() {
  cd "weechat"
  ./configure
  make -j"${NCPU}"
}

package() {
  cd "weechat"
  make install DESTDIR="${pkgdir}"
}
