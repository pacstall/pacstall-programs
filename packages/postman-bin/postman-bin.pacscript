name="postman-bin"
version="9.22.2"
description="Build, test, and document your APIs faster"
repology=("project: postman" "visiblename: postman-bin")
url="https://dl.pstmn.io/download/${version}/linux64"
hash="cfb85d7ae366ee1487ce1b2dab1c19ffa25c214af5c083a09447ed488493b115"
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

    sudo cp -r ${SRCDIR}/Postman/app/* ${STOWDIR}/${name}/opt/postman/
    sudo chmod +x "${STOWDIR}/${name}/opt/postman/postman"

    sudo ln -s -r "${STOWDIR}/${name}/opt/postman/app/resources/app/assets/icon.png" "${STOWDIR}/${name}/usr/share/icons/hicolor/128x128/apps/postman.png"
    sudo ln -s -r "${STOWDIR}/${name}/opt/postman/Postman" "${STOWDIR}/${name}/usr/bin/postman"
}
