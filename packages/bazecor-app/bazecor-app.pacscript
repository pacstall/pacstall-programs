name="bazecor-app"
pkgname="bazecor"
pkgver="1.3.3"
gives="bazecor"
pkgdesc="Bazecor is the graphical configurator for the Dygma Raise"
url="https://github.com/Dygmalab/Bazecor/releases/download/v${pkgver}/Bazecor-${pkgver}-x64.AppImage"
depends=("usbutils" "udev")
hash="109e48c2891a963bb7eb892ba3b223d258e2833a110ec6c54dc46cc190295c4f"
breaks=("bazecor" "bazecor-bin" "bazecor-deb" "bazecor-git")
arch=('amd64')
maintainer="Elsie19 <elsie19@pm.me>"
repology=("project: bazecor")

package() {
  sudo mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps/" "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
Name=Bazecor
Exec=bazecor %U
Terminal=false
Type=Application
Icon=bazecor
StartupWMClass=Bazecor
X-AppImage-Version=${pkgver}
Categories=Utility;" | sudo tee "${pkgdir}/usr/share/applications/bazecor.desktop" > /dev/null
  sudo wget -q https://raw.githubusercontent.com/Elsie19/images/master/bazecor.png -O "${pkgdir}/usr/share/icons/hicolor/256x256/apps/bazecor.png"
  sudo install -Dm755 "Bazecor-${pkgver}-x64.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

post_install() {
  # Run `lsusb` to get the IDs for the currently attached Dygma keyboard.
  idstring="$(lsusb | grep Dygma | grep -o 'ID.*:[[:alnum:]]*' | sed 's/ID //')"

  # Split the string by delimiter ":" to get the two numbers.
  # shellcheck disable=SC2206
  ids=(${idstring//:/ })
  XXXX="${ids[0]}"
  YYYY="${ids[1]}"
  line="SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"${YYYY}\", ATTRS{idProduct}==\"${XXXX}\", GROUP=\"users\", MODE=\"0666\""

  # Generate the rule file.
  mkdir -p /etc/udev/rules.d/
  echo "${line}" | sudo tee /etc/udev/rules.d/50-dygma.rules > /dev/null

  # Reload the `udev` rules.
  udevadm control --reload-rules || :
}

post_remove() {
  sudo rm -f /etc/udev/rules.d/50-dygma.rules
}
