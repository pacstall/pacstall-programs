name="gtkhash"
pkgname="gtkhash"
version="1.4"
url="https://github.com/tristanheaven/gtkhash/releases/download/v1.4/gtkhash-1.4.tar.xz"
build_depends="dh-autoreconf libgcrypt-dev libtool nettle-dev libb2-dev openssl libmbedtls-dev intltool"
depends="libgtk-3-dev libglib2.0-dev"
breaks=""
description=“gtkhash is a desktop utility for computing message digests or checksums.”
hash="20b57dbb8f6c6d7323f573c111a11640603a422c5f9da7b302a4981e4adc37c4"
removescript="no"
optdepends=""
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
prepare() {
    ./configure
    wget -q http://0x0.st/-BWT.png
    wget -q https://gist.githubusercontent.com/WRM-42/37ff456ff73b84d16755d55cbab73b8f/raw/94b6bce3552e1206d575b2ced57592b50f2029b8/gtkhash.desktop
}

build() {
   make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/gtkhash
    mv -BWT.png /usr/src/pacstall/gtkhash/usr/share/icons
    mv gtkhash.desktop /usr/src/pacstall/gtkhash/usr/share/applications
}
