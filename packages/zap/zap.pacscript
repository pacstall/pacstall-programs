name="zap"
version="2.2.1"
depends="curl grep jq wget"
url="https://github.com/srevinsaju/zap/releases/download/v2.2.1/zap-amd64"
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
        curl https://raw.githubusercontent.com/srevinsaju/zap/main/install.sh | sudo bash -s
}

removescript() {
          rm install.sh
}
