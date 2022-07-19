name="arduino-ide-bin"
pkgname="arduino-ide"
version="1.8.19"
repology=("project: arduino")
maintainer="DismissedGuy <me@mikealmel.ooo>"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
url="https://downloads.arduino.cc/arduino-${version}-linux64.tar.xz"
description="An open-source IDE that makes it easy to write code and upload it to Arduino boards"
hash="eb68bddc1d1c0120be2fca1350a03ee34531cf37f51847b21210b6e70545bc9b"

prepare() {
  sudo mkdir -p "${STOWDIR}/${name}/usr/share/${pkgname}/"
  sudo mkdir -p "${STOWDIR}/${name}/usr/share/applications/"
  sudo mkdir -p "${STOWDIR}/${name}/usr/share/icons/"
  sudo mkdir -p "${STOWDIR}/${name}/usr/local/bin/"
}

build() {
  true
}

install() {
  DEST="${STOWDIR}/${name}"

  # create .desktop from template
  sed -e "s,<BINARY_LOCATION>,\"${DEST}/usr/share/${pkgname}/arduino\",g" \
      -e "s,<ICON_NAME>,arduino-arduinoide,g" "lib/desktop.template" \
      | sudo tee "${DEST}/usr/share/applications/${pkgname}.desktop" > /dev/null

  # register mimetype
  sudo install -Dm 644 "lib/arduino-arduinoide.xml" -t "${DEST}/usr/share/mime/packages/"

  # install icons / mimetypes
  for size in 16 24 32 48 64 72 96 128 256; do
    # mimetypes
    sudo install -dm 755 "${DEST}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    sudo install -Dm 644 "lib/icons/${size}x${size}/apps/arduino.png" "${DEST}/usr/share/icons/hicolor/${size}x${size}/mimetypes/text-x-arduino.png"

    # icons
    sudo install -dm 755 "${DEST}/usr/share/icons/hicolor/${size}x${size}/apps"
    sudo install -Dm 644 "lib/icons/${size}x${size}/apps/arduino.png" "${DEST}/usr/share/icons/hicolor/${size}x${size}/apps/arduino-arduinoide.png"
  done

  # install the program
  sudo mv ./* "${DEST}/usr/share/${pkgname}/"
}

postinst() {
  # link main executable so it is in PATH
  sudo ln -s "${STOWDIR}/${name}/usr/share/${pkgname}/arduino" "/usr/local/bin/arduino"

  fancy_message info "Please run the following command to authorize access to the Arduino's serial interface: \"sudo usermod -aG uucp dialout ${USER}\". You might have to log out and in again for the changes to take effect."
}

removescript() {
  # remove linked executable
  sudo rm "/usr/local/bin/arduino"
}
