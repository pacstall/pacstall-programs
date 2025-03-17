pkgname="lm-studio-app"
gives="lm-studio"
pkgver="0.3.13-2"
pkgdesc="Experiment with LLMs on your computer."
url='https://lmstudio.ai'
arch=('amd64')
replaces=("${gives}")
source=(
  "https://installers.lmstudio.ai/linux/x64/${pkgver}/LM-Studio-${pkgver}-x64.AppImage"
)
appimage="LM-Studio-${pkgver}-x64.AppImage"
sha256sums=(
  "5a05217e4f0588e22e6aa9c4d61d3eacdc4f11023179d17e0f48357ec3294908"
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

  icon_extension=".png"
  ./"${appimage}" --appimage-extract "${gives}${icon_extension}" &> /dev/null
  # ${gives}.png is likely a symlink, so we need to get the actual file
  if [[ -L "squashfs-root/${gives}${icon_extension}" ]]; then
    actual_icon=$(readlink "squashfs-root/${gives}${icon_extension}")
    ./"${appimage}" --appimage-extract "${actual_icon}" &> /dev/null
    install -Dm644 "squashfs-root/${actual_icon}" -t "${pkgdir}/usr/share/icons/hicolor/0x0/apps"
  else
    install -Dm644 "squashfs-root/${gives}${icon_extension}" -t "${pkgdir}/usr/share/icons/hicolor/0x0/apps"
  fi

  src_icon="${pkgdir}/usr/share/icons/hicolor/0x0/apps/${gives}${icon_extension}"
  sizes=("16x16" "32x32" "48x48" "64x64" "128x128" "256x256")

  # check if gm convert or imagemagick is installed
  if command -v gm &> /dev/null; then
    # Loop through each size and create resized icons
    for size in "${sizes[@]}"; do
      install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
      gm convert "${src_icon}" -resize "${size}" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${gives}${icon_extension}"
    done
  elif command -v convert &> /dev/null; then
    # Loop through each size and create resized icons
    for size in "${sizes[@]}"; do
      install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
      convert "${src_icon}" -resize "${size}" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${gives}${icon_extension}"
    done
  else
    echo "Neither gm nor convert is installed. Please install one of them to resize the icon."
  fi
}
