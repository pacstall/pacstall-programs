name="arduino-ide-bin"
pkgname="arduino-ide"
version="2.0.4"
repology=("project: arduino")
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
url="https://downloads.arduino.cc/${pkgname}/${pkgname}_${version}_Linux_64bit.zip"
description="An open-source IDE that makes it easy to write code and upload it to Arduino boards"
hash="d8855ec9e306b96fbe4059b61c1a0fc6b7c7ccd8c963d31a8e8c09e4ac22b1c2"

prepare() {
  # potential leftover symlink from v1
  sudo rm -f "/usr/local/bin/arduino"

  sudo mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo mkdir -p "${pkgdir}/usr/share/pixmaps/"
}

install() {
  # install files
  sudo cp -R ./* "${pkgdir}/usr/share/${pkgname}/"

  # fetch .desktop file + icon
  wget -q "https://www.arduino.cc/wiki/370832ed4114dd35d498f2f449b4781e/arduino.svg"
  sudo install -Dm644 "arduino.svg" "${pkgdir}/usr/share/pixmaps/arduino-ide-v2.svg"
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "arduino-ide.desktop" "${pkgdir}/usr/share/applications/"
}

postinst() {
  # link main executable so it is in PATH
  sudo ln -sf "/usr/share/${pkgname}/arduino-ide" "/usr/local/bin/arduino-ide"

  fancy_message info "Please run the following command to authorize access to the Arduino's serial interface: \"sudo usermod -aG uucp dialout ${USER:-$(whoami)}\". You might have to log out and in again for the changes to take effect."
}

removescript() {
  # remove linked executable
  sudo rm -f "/usr/local/bin/arduino-ide"
}
