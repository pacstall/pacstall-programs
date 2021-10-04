name="tmux"
version="3.2a"
url="https://github.com/tmux/tmux/releases/download/${version}/tmux-${version}.tar.gz"
build_depends="gcc make pkg-config bison"
depends="libncurses-dev libevent-dev"
breaks="tmux-git"
replace="tmux"
description="A terminal multiplexer"
hash="551553a4f82beaa8dadc9256800bcc284d7c000081e47aa6ecbb6ff36eacd05f"
optdepends=("libutempter-dev: Record user sessions to utmp and wtmp files [add to depends array and rebuild to enable]")
maintainer="Harshwardhan Mehrotra <abrakadabra18262@protonmail.com>"
prepare() {
          ./autogen.sh
}
build() {
        ./configure
        make -j$(nproc)
}
install() {
          sudo make install DESTDIR="$STOWDIR/$name"
          sudo install -Dm755 example_tmux.conf "$STOWDIR/$name/usr/share/tmux/example_tmux.conf"
}

