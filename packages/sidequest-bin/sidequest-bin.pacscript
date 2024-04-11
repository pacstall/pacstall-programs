pkgname="sidequest-bin"
gives="sidequest"
pkgdesc="Place to get more apps for your Oculus Quest by sideloading"
pkgver="0.10.36"
source=(
  "https://github.com/SideQuestVR/SideQuest/releases/download/v${pkgver}/SideQuest-${pkgver}.tar.xz"
  "${gives}.png::https://sidequestvr.com/assets/images/score-logo.png"
)
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=(
  "8228904ed14a4a67038c18be349056b7e7ad713537536473a00a0744ed061fd1"
  "SKIP"
)
arch=('amd64')
repology=("project: sidequest")

package() {
  cd "${srcdir}"
  # Make dirs and assign permissions
  mkdir -p "${pkgdir}/opt/sidequest"
  cp -r "SideQuest-${pkgver}"/* "${pkgdir}/opt/sidequest"
  # Install the icon for the desktop file
  install -Dm644 "${srcdir}/${gives}.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install the desktop file
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
Name=SideQuest
Icon=sidequest
Type=Application
Exec=/opt/sidequest/sidequest" | tee "${pkgdir}/usr/share/applications/sidequest.desktop" > /dev/null
}
