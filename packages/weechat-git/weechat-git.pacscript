name="weechat-git"
pkgname="weechat"
repology=("project: ${pkgname}")
url="https://github.com/weechat/weechat.git"
build_depends="build-essential pkg-config g++"
depends="libncursesw5-dev libcurl4-gnutls-dev libgcrypt20-dev libgnutls28-dev zlib1g-dev libzstd-dev gettext ca-certificates libaspell-dev python3-dev libperl-dev ruby2.7-dev liblua5.4-dev tcl-dev guile-2.2-dev libv8-dev php-dev libphp-embed libxml2-dev libargon2-dev libsodium-dev asciidoctor ruby-pygments.rb libcpputest-dev"
replace="${pkgname}"
description="WeeChat (Wee Enhanced Environment for Chat) is a free chat client, fast and light, designed for many operating systems"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
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
    sudo make install DESTDIR="${STOWDIR}/${name}"
}
