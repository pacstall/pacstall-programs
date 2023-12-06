name="arduino-ide-bin"
gives="arduino-ide"
pkgver="2.2.1"
repology=("project: arduino")
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
url="https://downloads.arduino.cc/${gives}/${gives}_${pkgver}_Linux_64bit.zip"
pkgdesc="An open-source IDE that makes it easy to write code and upload it to Arduino boards"
hash="97cae4f65aa717c45e868c0314068d9130bda3a94a76f4db0dc5bcbe71385481"

prepare() {
  # potential leftover symlink from v1
  sudo rm -f "/usr/local/bin/arduino"

  sudo mkdir -p "${pkgdir}/usr/share/${gives}/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo mkdir -p "${pkgdir}/usr/share/pixmaps/"
}

package() {
  # install files
  sudo cp -R ./* "${pkgdir}/usr/share/${gives}/"

  # fetch .desktop file + icon
  wget -q "https://www.arduino.cc/wiki/370832ed4114dd35d498f2f449b4781e/arduino.svg"
  sudo install -Dm644 "arduino.svg" "${pkgdir}/usr/share/pixmaps/arduino-ide-v2.svg"
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${gives}.desktop"
  sudo install -Dm644 "arduino-ide.desktop" "${pkgdir}/usr/share/applications/"
}

post_install() {
  # link main executable so it is in PATH
  sudo ln -sf "/usr/share/${gives}/arduino-ide" "/usr/local/bin/arduino-ide"

  fancy_message info "Please run the following command to authorize access to the Arduino's serial interface: \"sudo usermod -aG uucp dialout ${USER:-$(whoami)}\". You might have to log out and in again for the changes to take effect."
}

post_remove() {
  # remove linked executable
  sudo rm -f "/usr/local/bin/arduino-ide"
}
