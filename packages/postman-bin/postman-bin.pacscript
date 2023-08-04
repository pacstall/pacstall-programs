name="postman-bin"
version="10.16.0"
description="Build, test, and document your APIs faster"
repology=("project: postman" "visiblename: postman-bin")
url="https://dl.pstmn.io/download/version/${version}/linux64"
hash="055dff2b282b8f494743dd07896c04b7e76a2f88e87e8f8a4b80192ba70bb47d"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="postman"
breaks=("postman" "postman-deb" "postman-app")
depends=("libxss1" "libnss3" "libgtk-3-0")

package() {
  # Get desktop file and install it
  wget -q "https://aur.archlinux.org/cgit/aur.git/plain/postman.desktop?h=postman-bin" -O postman.desktop
  sudo install -Dm644 postman.desktop -t "${pkgdir}/usr/share/applications"

  # Install the rest of the app
  sudo install -d "${pkgdir}/opt/postman/" "${pkgdir}/usr/bin"
  sudo install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"

  sudo cp -r "${SRCDIR}/Postman/app/"* "${pkgdir}/opt/postman/"
  sudo chmod +x "${pkgdir}/opt/postman/postman"
}

post_install() {
  sudo ln -s -r "/opt/postman/resources/app/assets/icon.png" "/usr/share/icons/hicolor/128x128/apps/postman.png"
  sudo ln -s -r "/opt/postman/Postman" "/usr/bin/postman"
}

post_remove() {
  sudo rm -f "/usr/share/icons/hicolor/128x128/apps/postman.png"
  sudo rm -f "/usr/bin/postman"
}
