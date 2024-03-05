name="sidequest-bin"
pkgname="sidequest"
gives="sidequest"
pkgdesc="Place to get more apps for your Oculus Quest by sideloading"
pkgver="0.10.36"
source=(
  "https://github.com/SideQuestVR/SideQuest/releases/download/v${pkgver}/SideQuest-${pkgver}.tar.xz"
  "${pkgname}.png::https://sidequestvr.com/assets/images/score-logo.png"
)
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash=("8228904ed14a4a67038c18be349056b7e7ad713537536473a00a0744ed061fd1" "SKIP")
arch=('amd64')
repology=("project: sidequest")

package() {
  cd ..
  # Make dirs and assign permissions
  sudo mkdir -p "${pkgdir}/opt/sidequest"
  sudo cp -r "SideQuest-${pkgver}"/* "${pkgdir}/opt/sidequest"
  # Install the icon for the desktop file
  sudo install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the desktop file
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
Name=SideQuest
Icon=sidequest
Type=Application
Exec=/opt/sidequest/sidequest" | sudo tee "${pkgdir}/usr/share/applications/sidequest.desktop" > /dev/null
}
