name="arduino-ide-bin"
pkgname="arduino-ide"
pkgver="2.3.2"
repology=("project: arduino")
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
url="https://downloads.arduino.cc/${pkgname}/${pkgname}_${pkgver}_Linux_64bit.zip"
pkgdesc="An open-source IDE that makes it easy to write code and upload it to Arduino boards"
hash="1a23b911043a247116ace846f03a0265c719dcd49cf9a8af09334db4d3916e88"

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
  sudo mkdir -p "${pkgdir}/usr/local/bin"
  sudo ln -s "/usr/share/${pkgname}/arduino-ide" "${pkgdir}/usr/local/bin/arduino-ide"
}

post_install() {
  # link main executable so it is in PATH

  fancy_message info "Please run the following command to authorize access to the Arduino's serial interface: \"sudo usermod -aG uucp,dialout \${USER:-\$(whoami)}\". You might have to log out and in again for the changes to take effect."
}
