name="firefox"
version="92.0.1"
maintainer="aranym <aranym1@pm.me>"
url="https://download-installer.cdn.mozilla.net/pub/${name}/releases/${version}/linux-x86_64/en-US/${name}-${version}.tar.bz2"
depends="lsb-release libatk1.0-0 libc6 libcairo-gobject2 libcairo2 libdbus-1-3 libdbus-glib-1-2 libfontconfig1 libfreetype6 libgcc-s1 libgdk-pixbuf-2.0-0 libglib2.0-0 libgtk-3-0 libharfbuzz0b libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb-shm0 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrender1"
description="Safe and easy web browser from Mozilla"
hash="a3ba62122a6cde1d7d2ebf96e765ea57ea3e9a312d2161e0ac70923946844689"

prepare() {
    sudo mkdir -p /usr/src/pacstall/firefox/usr/share/icons
    sudo mkdir -p /usr/src/pacstall/firefox/usr/bin
    sudo mkdir -p /usr/src/pacstall/firefox/usr/share/applications
    wget -q https://gist.githubusercontent.com/aranym0/dad87fbc9f388e2917d625534e8f05a5/raw/e4e8014ed7e2cf1b05971e048074f0ba7e9b5845/firefox.desktop 
}

build() {
    true
}

install() {
    sudo mv ./browser/chrome/icons/default/default128.png /usr/src/pacstall/firefox/usr/share/icons
    sudo mv ./firefox.desktop /usr/src/pacstall/firefox/usr/share/applications
    sudo mv ./* /usr/src/pacstall/firefox/usr/bin
}
