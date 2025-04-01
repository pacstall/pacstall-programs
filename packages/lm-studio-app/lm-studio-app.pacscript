pkgname="lm-studio-app"
gives="lm-studio"
pkgver="0.3.14-5"
pkgdesc="Experiment with LLMs on your computer."
url='https://lmstudio.ai'
arch=('amd64')
replaces=("${gives}")
makedepends=("imagemagick")
source=(
  "https://installers.lmstudio.ai/linux/x64/${pkgver}/LM-Studio-${pkgver}-x64.AppImage"
)
appimage="LM-Studio-${pkgver}-x64.AppImage"
sha256sums=(
  "5ab3bde5ecfcd7f0345354edd4e8b63f2529ea7bec9903332b4554547d5361b8"
)
maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")

package() {
  cd "${srcdir}"

  # Make the AppImage executable
  chmod +x "${appimage}"

  # Extract the .desktop and .png files from the AppImage
  ./"${appimage}" --appimage-extract "${gives}.desktop" &> /dev/null

  # Install the AppImage to the /usr/bin directory
  install -Dm755 "${appimage}" "${pkgdir}/usr/bin/${gives}"

  # Install the .desktop file to the applications directory
  install -Dm644 "squashfs-root/${gives}.desktop" -t "${pkgdir}/usr/share/applications"

  # Modify the .desktop file to use the correct executable path
  sed -i "s|Exec=AppRun|Exec=APPIMAGELAUNCHER_DISABLE=1 /usr/bin/${gives}|g" "${pkgdir}/usr/share/applications/${gives}.desktop"

  ./"${appimage}" --appimage-extract "lm-studio.png" &> /dev/null
  # ${gives}.png is likely a symlink, so we need to get the actual file
  if [[ -L "squashfs-root/lm-studio.png" ]]; then
    actual_icon=$(readlink "squashfs-root/lm-studio.png")
    ./"${appimage}" --appimage-extract "${actual_icon}" &> /dev/null
    install -Dm644 "squashfs-root/${actual_icon}" -t "${pkgdir}/usr/share/icons/hicolor/0x0/apps"
  else # If it's not a symlink, just install it
    install -Dm644 "squashfs-root/lm-studio.png" -t "${pkgdir}/usr/share/icons/hicolor/0x0/apps"
  fi

  src_icon="${pkgdir}/usr/share/icons/hicolor/0x0/apps/lm-studio.png"
  sizes=("16x16" "32x32" "48x48" "64x64" "128x128" "256x256")

  # Loop through each size and create resized icons
  for size in "${sizes[@]}"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
    convert "${src_icon}" -resize "${size}" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/lm-studio.png"
  done
}
