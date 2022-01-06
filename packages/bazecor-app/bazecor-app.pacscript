name="bazecor-app"
pkgname="bazecor"
version="0.3.4"
gives="bazecor"
description="Bazecor is the graphical configurator for the Dygma Raise"
url="https://github.com/Dygmalab/Bazecor/releases/download/v${version}/Bazecor-${version}.AppImage"
hash="75680b07dc11d59778d03e78efd51c0928f1d333d65e6c3a412d04ac2ae61ff7"
breaks="bazecor bazecor-bin bazecor-deb bazecor-git"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 "Bazecor-${version}.AppImage" "/usr/src/pacstall/bazecor-app/usr/bin/$pkgname"
}

postinst() {
  # Run `lsusb` to get the IDs for the currently attached Dygma keyboard.
  idstring=$(lsusb | grep Dygma | grep -o 'ID.*:[[:alnum:]]*' | sed 's/ID //')

  # Split the string by delimiter ":" to get the two numbers.
  ids=(${idstring//:/ })
  XXXX=${ids[0]}
  YYYY=${ids[1]}
  line="SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"$YYYY\", ATTRS{idProduct}==\"$XXXX\", GROUP="users", MODE=\"0666\""

  # Generate the rule file.
  echo $line > tempfile
  echo "added templine"
  sudo mv tempfile /etc/udev/rules.d/50-dygma.rules

  # Reload the `udev` rules.
  sudo udevadm control --reload-rules
}

removescript() {
  sudo rm -f /etc/udev/rules.d/50-dygma.rules
}
