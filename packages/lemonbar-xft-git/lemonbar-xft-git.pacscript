name="lemonbar-xft-git"
version="0.0.1"
url="https://gitlab.com/protesilaos/lemonbar-xft/-/archive/xft-port/lemonbar-xft-xft-port.zip"
build_depends="build-essential libx11-dev libxft-dev libx11-xcb-dev libxcb-randr0-dev libxcb-xinerama0-dev"
depends=""
breaks="bar lemonbar"
description="A lightweight xcb based bar with ported xft support."
hash="c2ca60846e0cade326969dd3f1f10e723f1a94d90d0335132b844932e41effff"
prepare() {
	true
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/lemonbar-xft-git
}
