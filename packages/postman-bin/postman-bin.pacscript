name="postman-bin"
version="10.0.1"
description="Build, test, and document your APIs faster"
repology=("project: postman" "visiblename: postman-bin")
url="https://dl.pstmn.io/download/version/${version}/linux64"
hash="f4bff0f708de0c59481bd2189a61c21f56c81b3ceb423c6c1816bf8359b29e44"
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
    sudo ln -s -r "/opt/postman/app/resources/app/assets/icon.png" "/usr/share/icons/hicolor/128x128/apps/postman.png"
    sudo ln -s -r "/opt/postman/Postman" "/usr/bin/postman"
}

removescript() {
   sudo rm -f "/usr/share/icons/hicolor/128x128/apps/postman.png"
   sudo rm -f "/usr/bin/postman"
}
