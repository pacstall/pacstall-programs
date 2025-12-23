pkgname="bazecor-app"
gives="bazecor"
pkgver="1.8.3"
pkgdesc="Bazecor is the graphical configurator for the Dygma Raise"
source=(
  "https://github.com/Dygmalab/Bazecor/releases/download/v${pkgver}/Bazecor-${pkgver}-x64.AppImage"
  "https://raw.githubusercontent.com/Elsie19/images/master/bazecor.png"
)
depends=("usbutils" "udev")
sha256sums=(
  "380c0778b2db5be16529ecb14be3023938ab1c2bea669b626176de0379786097"
  "SKIP"
)
breaks=("bazecor" "bazecor-bin" "bazecor-deb" "bazecor-git")
arch=('amd64')
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: bazecor")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps/" "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
Name=Bazecor
Exec=env APPIMAGELAUNCHER_DISABLE=1 bazecor --no-sandbox %U
Terminal=false
Type=Application
Icon=bazecor
StartupWMClass=Bazecor
X-AppImage-Version=${pkgver}
Categories=Utility;" | tee "${pkgdir}/usr/share/applications/bazecor.desktop" > /dev/null
  install -Dm644 "${srcdir}/bazecor.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/bazecor.png"
  install -Dm755 "Bazecor-${pkgver}-x64.AppImage" "${pkgdir}/usr/bin/${gives}"

  # Run `lsusb` to get the IDs for the currently attached Dygma keyboard.
  idstring="$(lsusb | grep Dygma | grep -o 'ID.*:[[:alnum:]]*' | sed 's/ID //')"

  # Split the string by delimiter ":" to get the two numbers.
  # shellcheck disable=SC2206
  ids=(${idstring//:/ })
  XXXX="${ids[0]}"
  YYYY="${ids[1]}"
  line="SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"${YYYY}\", ATTRS{idProduct}==\"${XXXX}\", GROUP=\"users\", MODE=\"0666\""

  # Generate the rule file.
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  echo "${line}" | tee "${pkgdir}/etc/udev/rules.d/50-dygma.rules" > /dev/null
}

post_install() {
  # Reload the `udev` rules.
  udevadm control --reload-rules || :
}
