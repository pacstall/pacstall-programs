name="bazecor-app"
pkgname="bazecor"
version="1.0.0"
gives="bazecor"
description="Bazecor is the graphical configurator for the Dygma Raise"
url="https://github.com/Dygmalab/Bazecor/releases/download/bazecor-${version}/Bazecor-${version}.AppImage"
depends="usbutils udev"
hash="64d9a6253b0113446c78c8c097036de23b562aaebf04ee45d0dff68ddc3ce973"
breaks="bazecor bazecor-bin bazecor-deb bazecor-git"
repology=("project: bazecor")

install() {
    sudo mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps/" "${pkgdir}/usr/share/applications/"
    echo "[Desktop Entry]
Name=Bazecor
Exec=bazecor %U
Terminal=false
Type=Application
Icon=bazecor
StartupWMClass=Bazecor
X-AppImage-Version=${version}
Categories=Utility;" | sudo tee "${pkgdir}/usr/share/applications/bazecor.desktop" > /dev/null
    sudo wget -q https://raw.githubusercontent.com/Henryws/images/master/bazecor.png -O "${pkgdir}/usr/share/icons/hicolor/256x256/apps/bazecor.png"
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
    sudo mkdir -p /etc/udev/rules.d/
    echo "${line}" | sudo tee /etc/udev/rules.d/50-dygma.rules > /dev/null

    # Reload the `udev` rules.
    sudo udevadm control --reload-rules
}

removescript() {
    sudo rm -f /etc/udev/rules.d/50-dygma.rules
}
