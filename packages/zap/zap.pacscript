name="zap"
version="2.2.1"
build_depends="curl grep jq wget"
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
