name="postman-bin"
version="10.8.0"
description="Build, test, and document your APIs faster"
repology=("project: postman" "visiblename: postman-bin")
url="https://dl.pstmn.io/download/version/${version}/linux64"
hash="213e6b97509726ea7877c68050a84e3b1db9676793394abe8c16fa75eb0b6fd4"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="postman"
breaks="postman postman-deb postman-app"

depends="libxss1 libnss3 libgtk-3-0"

prepare() {
    true
}

build() {
    true
}

install() {
    # Get desktop file and install it
    wget -q "https://aur.archlinux.org/cgit/aur.git/plain/postman.desktop?h=postman-bin" -O postman.desktop
    sudo install -Dm644 postman.desktop -t "${STOWDIR}/${name}/usr/share/applications"

    # Install the rest of the app
    sudo install -d "${STOWDIR}/${name}/opt/postman/" "${STOWDIR}/${name}/usr/bin"
    sudo install -d "${STOWDIR}/${name}/usr/share/icons/hicolor/128x128/apps"

    sudo cp -r ${SRCDIR}/Postman/app/* "${STOWDIR}/${name}/opt/postman/"
    sudo chmod +x "${STOWDIR}/${name}/opt/postman/postman"
}

postinst() {
    sudo ln -s -r "/opt/postman/resources/app/assets/icon.png" "/usr/share/icons/hicolor/128x128/apps/postman.png"
    sudo ln -s -r "/opt/postman/Postman" "/usr/bin/postman"
}

removescript() {
   sudo rm -f "/usr/share/icons/hicolor/128x128/apps/postman.png"
   sudo rm -f "/usr/bin/postman"
}
