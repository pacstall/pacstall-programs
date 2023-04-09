name="bazecor-app"
pkgname="bazecor"
version="1.0.0"
gives="bazecor"
description="Bazecor is the graphical configurator for the Dygma Raise"
url="https://github.com/Dygmalab/Bazecor/releases/download/bazecor-${version}/Bazecor-${version}.AppImage"
depends="usbutils"
hash="64d9a6253b0113446c78c8c097036de23b562aaebf04ee45d0dff68ddc3ce973"
breaks="bazecor bazecor-bin bazecor-deb bazecor-git"
repology=("project: bazecor")

install() {
  sudo install -Dm755 "Bazecor-${version}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

postinst() {
  # Run `lsusb` to get the IDs for the currently attached Dygma keyboard.
  idstring="$(lsusb | grep Dygma | grep -o 'ID.*:[[:alnum:]]*' | sed 's/ID //')"

  # Split the string by delimiter ":" to get the two numbers.
  # shellcheck disable=SC2206
  ids=(${idstring//:/ })
  XXXX="${ids[0]}"
  YYYY="${ids[1]}"
  line="SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"${YYYY}\", ATTRS{idProduct}==\"${XXXX}\", GROUP=\"users\", MODE=\"0666\""

  # Generate the rule file.
  echo "${line}" > tempfile
  echo "added templine"
  sudo mkdir -p /etc/udev/rules.d/
  sudo mv tempfile /etc/udev/rules.d/50-dygma.rules

  # Reload the `udev` rules.
  sudo udevadm control --reload-rules
}

removescript() {
  sudo rm -f /etc/udev/rules.d/50-dygma.rules
}
