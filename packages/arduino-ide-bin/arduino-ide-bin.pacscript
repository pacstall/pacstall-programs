name="arduino-ide-bin"
pkgname="arduino-ide"
pkgver="2.3.0"
repology=("project: arduino")
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
url="https://downloads.arduino.cc/${pkgname}/${pkgname}_${pkgver}_Linux_64bit.zip"
pkgdesc="An open-source IDE that makes it easy to write code and upload it to Arduino boards"
hash="fcb3184ca5204a2eb2c03e93cad4d3a97fd8751b377c9724ed90b21a2ffed490"

prepare() {
  # potential leftover symlink from v1
  sudo rm -f "/usr/local/bin/arduino"

  sudo mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo mkdir -p "${pkgdir}/usr/share/pixmaps/"
}

package() {
  # install files
  sudo cp -R ./* "${pkgdir}/usr/share/${pkgname}/"

  # fetch .desktop file + icon
  wget -q "https://www.arduino.cc/wiki/370832ed4114dd35d498f2f449b4781e/arduino.svg"
  sudo install -Dm644 "arduino.svg" "${pkgdir}/usr/share/pixmaps/arduino-ide-v2.svg"
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "arduino-ide.desktop" "${pkgdir}/usr/share/applications/"
}

post_install() {
  # link main executable so it is in PATH
  sudo ln -sf "/usr/share/${pkgname}/arduino-ide" "/usr/local/bin/arduino-ide"

  fancy_message info "Please run the following command to authorize access to the Arduino's serial interface: \"sudo usermod -aG uucp,dialout \${USER:-\$(whoami)}\". You might have to log out and in again for the changes to take effect."
}

post_remove() {
  # remove linked executable
  sudo rm -f "/usr/local/bin/arduino-ide"
}
