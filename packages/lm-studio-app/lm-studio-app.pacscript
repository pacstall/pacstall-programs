pkgname="lm-studio-app"
gives="lm-studio"
pkgver="0.3.13-2"
pkgdesc="Experiment with LLMs on your computer."
url='https://lmstudio.ai'
arch=('amd64')
replaces=("${gives}")
source=(
  "https://installers.lmstudio.ai/linux/x64/${pkgver}/LM-Studio-${pkgver}-x64.AppImage"
  "https://lmstudio.ai/_next/static/media/android-chrome-192x192.3a60873f.png"
)
appimage="LM-Studio-${pkgver}-x64.AppImage"
sha256sums=(
  "5a05217e4f0588e22e6aa9c4d61d3eacdc4f11023179d17e0f48357ec3294908"
  "f0a738b118a2b80fbcbd010968ca86ba81cc175c8654e62994e85d19dd08235e"
)
maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")

package() {
  cd "${srcdir}"

  chmod +x "${appimage}"
  ./"${appimage}" --appimage-extract "${gives}.desktop" &> /dev/null
  ./"${appimage}" --appimage-extract "${gives}.png" &> /dev/null

  install -Dm755 "${appimage}" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "squashfs-root/${gives}.desktop" -t "${pkgdir}/usr/share/applications"

  sed -i "s|Exec=AppRun|Exec=APPIMAGELAUNCHER_DISABLE=1 /usr/bin/${gives}|g" "${pkgdir}/usr/share/applications/${gives}.desktop"

  mv "android-chrome-192x192.3a60873f.png" "${gives}.png"
  install -Dm644 "${gives}.png" -t "${pkgdir}/usr/share/icons/hicolor/192x192/apps"
}
