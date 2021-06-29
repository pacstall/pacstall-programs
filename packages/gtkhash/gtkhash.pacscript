name="gtkhash"
version="1.4"
url="https://github.com/tristanheaven/$name/releases/download/v$version/$name-$version.tar.xz"
build_depends="autoconf automake libtool intltool wget"
depends="libgtk-3-dev libglib2.0-dev libgcrypt-dev nettle-dev libb2-dev openssl libmbedtls-dev"
replace="$name"
description="$name is a desktop utility for computing message digests or checksums."
hash="20b57dbb8f6c6d7323f573c111a11640603a422c5f9da7b302a4981e4adc37c4"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
   ./configure --enable-mbedtls --enable-nettle
   make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/$name
    sudo install -Dm644 COPYING -t /usr/src/pacstall/$name/usr/share/licenses/$name
    sudo install -Dm644 README.md -t /usr/src/pacstall/$name/usr/share/doc/$name
}

removescript() {
    sudo rm -rf /usr/share/licenses/$name
    sudo rm -rf /usr/share/doc/$name
}
