pkgname="lm-studio-app"
gives="lm-studio"
pkgver="0.3.13-2"
pkgdesc="Experiment with LLMs on your computer."
url='https://lmstudio.ai'
arch=('amd64')
replaces=("${gives}")
_icon_name="android-chrome-192x192.3a60873f.png"
source=(
  "https://installers.lmstudio.ai/linux/x64/${pkgver}/LM-Studio-${pkgver}-x64.AppImage"
  "https://lmstudio.ai/_next/static/media/${_icon_name}"
)
appimage="LM-Studio-${pkgver}-x64.AppImage"
sha256sums=(
  "5a05217e4f0588e22e6aa9c4d61d3eacdc4f11023179d17e0f48357ec3294908"
  "f0a738b118a2b80fbcbd010968ca86ba81cc175c8654e62994e85d19dd08235e"
)
maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")

package() {
  cd "${srcdir}"

  # Make the AppImage executable
  chmod +x "${appimage}"

  # Extract the .desktop and .png files from the AppImage
  ./"${appimage}" --appimage-extract "${gives}.desktop" &> /dev/null
  ./"${appimage}" --appimage-extract "${gives}.png" &> /dev/null

  # Install the AppImage to the /usr/bin directory
  install -Dm755 "${appimage}" "${pkgdir}/usr/bin/${gives}"

  # Install the .desktop file to the applications directory
  install -Dm644 "squashfs-root/${gives}.desktop" -t "${pkgdir}/usr/share/applications"

  # Modify the .desktop file to use the correct executable path
  sed -i "s|Exec=AppRun|Exec=APPIMAGELAUNCHER_DISABLE=1 /usr/bin/${gives}|g" "${pkgdir}/usr/share/applications/${gives}.desktop"

  # Check if the icon file is available locally
  if [[ -f ${_icon_name} ]]; then
    mv "${_icon_name}" "${gives}.png"
    # Install the icon to the icons directory
    install -Dm644 "${gives}.png" -t "${pkgdir}/usr/share/icons/hicolor/192x192/apps"
  else
    # If the icon is not available locally, try to download it from the website
    if [[ -n $(curl -s "https://lmstudio.ai/") ]]; then
      icon_url=$(curl -s "https://lmstudio.ai/" | grep -oP '<link\srel="icon"\shref="\K[^"]+' | sed 's|^|https://lmstudio.ai|')
      echo "Icon not found, downloading from \"${icon_url}\""
      curl -s -o "${gives}.png" "${icon_url}"
      # Install the downloaded icon to the icons directory
      install -Dm644 "${gives}.png" -t "${pkgdir}/usr/share/icons/hicolor/192x192/apps"
    else
      # If the website is not reachable, print an error message
      echo "Could not reach lmstudio.ai, skipping icon download. This is likely due to the sandbox in pacstall. If you want to download and install the icon as well, disable the sandbox by adding -Ns to the command."
    fi
  fi
}
