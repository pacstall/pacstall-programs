name="zap"
version="2.2.1"
depends="curl grep jq wget"
url="https://github.com/srevinsaju/zap/releases/download/v2.2.1/zap-amd64"
hash="4972edd5da1be5c5dd2fa14619c7068b09fd9dc31c1feea50ed564cdb14df6bc"
description="A delightful AppImage package manager"
maintainer="srevinsaju <hello@srev.in>"

prepare() {
        true
}

# doesn't need to be built
build() {
        true
}

install() {
        sudo cp zap-amd65 "$pkgdir/usr/bin/zap"
}

removescript() {
          rm install.sh
}
