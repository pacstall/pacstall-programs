name="gtkhash"
version="1.4"
url="https://github.com/tristanheaven/gtkhash/releases/download/v1.4/gtkhash-1.4.tar.xz"
build_depends="dh-autoreconf libgcrypt-dev libtool nettle-dev libb2-dev openssl libmbedtls-dev intltool wget"
depends="libgtk-3-dev libglib2.0-dev"
replace="gtkhash"
description="gtkhash is a desktop utility for computing message digests or checksums."
hash="20b57dbb8f6c6d7323f573c111a11640603a422c5f9da7b302a4981e4adc37c4"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
prepare() {
    wget -q https://github.com/WRM-42/GTKHash-ICO-Desktop/blob/main/gtkhash-logo.png
    wget -q https://raw.githubusercontent.com/WRM-42/GTKHash-ICO-Desktop/main/gtkhash.desktop
    sudo mkdir -p /usr/src/pacstall/gtkhash/usr/share/applications
    sudo mkdir -p /usr/src/pacstall/gtkhash/usr/share/icons/hicolor/128x128/apps
    ./configure
}

build() {
   make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/gtkhash
    sudo mv gtkhash-logo.png /usr/src/pacstall/gtkhash/usr/share/icons/hicolor/128x128/apps
    sudo mv gtkhash.desktop /usr/src/pacstall/gtkhash/usr/share/applications
}
