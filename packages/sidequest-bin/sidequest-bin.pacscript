name="sidequest-bin"
gives="sidequest"
pkgdesc="Place to get more apps for your Oculus Quest by sideloading"
pkgver="0.10.36"
url="https://github.com/SideQuestVR/SideQuest/releases/download/v${pkgver}/SideQuest-${pkgver}.tar.xz"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
hash="8228904ed14a4a67038c18be349056b7e7ad713537536473a00a0744ed061fd1"
arch=('amd64')
repology=("project: sidequest")
__icon_url="https://sidequestvr.com/assets/images/score-logo.png"

package() {
  cd ..
  # Make dirs and assign permissions
  sudo mkdir -p "${pkgdir}/opt/sidequest"
  sudo cp -r "SideQuest-${pkgver}"/* "${pkgdir}/opt/sidequest"
  # Install the icon for the desktop file
  wget -q -O "${gives}.png" "${__icon_url}"
  sudo install -Dm644 "${gives}.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install the desktop file
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
Name=SideQuest
Icon=sidequest
Type=Application
Exec=/opt/sidequest/sidequest" | sudo tee "${pkgdir}/usr/share/applications/sidequest.desktop" > /dev/null
}
