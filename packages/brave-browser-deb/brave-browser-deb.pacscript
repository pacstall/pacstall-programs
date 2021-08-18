name="brave-browser-deb"
gives="brave-browser"
version="1.28.105"
url="https://github.com/brave/brave-browser/archive/refs/tags/v1.28.105.tar.gz"
description="Secure, Fast & Private Web Browser with Adblocker."
hash="a43869da8e21d145f71a61c0eedc37d5908c74e250b73f23e192fd831232c884"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
          wget -q https://github.com/brave/brave-browser/releases/download/v$version/${gives}_${version}_amd64.deb
}

build() {
        true
}

install() {
          sudo dpkg -i ${gives}_${version}_amd64.deb
          sudo apt install -f
}