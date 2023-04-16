name="sidequest-bin"
pkgname="sidequest"
gives="sidequest"
description="Place to get more apps for your Oculus Quest by sideloading"
version="0.10.33"
url="https://github.com/SideQuestVR/SideQuest/releases/download/v${version}/SideQuest-${version}.tar.xz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="8ac3d97400a8e3ce86902b5bea7b8d042a092acd888d20e5139490a38507f995"
arch=('amd64')
repology=("project: sidequest")
__icon_url="https://sidequestvr.com/assets/images/score-logo.png"

install() {
  cd ..
  # Make dirs and assign permissions
  sudo mkdir -p "${pkgdir}/opt/sidequest"
  sudo cp -r "SideQuest-${version}"/* "${pkgdir}/opt/sidequest"
  # Install the icon for the desktop file
  wget -q -O "${pkgname}.png" "${__icon_url}"
  sudo install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the desktop file
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
Name=SideQuest
Icon=sidequest
Type=Application
Exec=/opt/sidequest/sidequest" | sudo tee "${pkgdir}/usr/share/applications/sidequest.desktop" > /dev/null
}
