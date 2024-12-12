pkgname="minecraft-pi-reborn-app"
gives="minecraft-pi-reborn"
pkgver="2.5.3"
breaks=("${gives}-git" "${gives}-deb" "${gives}-bin" "minecraft-pi-reborn-client")
pkgdesc="Minecraft Pi edition reborn with new features and for x86 pc."
makedepends=('desktop-file-utils')
sha256sums=(
  "f00e77a85fbab907af274416fb1c4b78216c1c49a992eeeb54378269a5171156"
  "SKIP"
  "SKIP"
  "SKIP"
)
arch=('amd64')
source=(
  "https://gitea.thebrokenrail.com/minecraft-pi-reborn/minecraft-pi-reborn/releases/download/${pkgver}/minecraft-pi-reborn-client-${pkgver}-amd64.AppImage"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/minecraft-pi-reborn-app/com.thebrokenrail.MCPIRebornClient.desktop"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/minecraft-pi-reborn-app/com.thebrokenrail.MCPIRebornClient.appdata.xml"
  "https://gitea.thebrokenrail.com/minecraft-pi-reborn/minecraft-pi-reborn/raw/tag/${pkgver}/images/icon.png"
)
maintainer=("cat-master21 <96554164+cat-master21@users.noreply.github.com>")
repology=("project: ${gives}")

prepare() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/metainfo" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
}

package() {
  cd "${srcdir}"
  install -Dm644 "minecraft-pi-reborn-client-${pkgver}-amd64.AppImage" "${pkgdir}/usr/bin/minecraft-pi-reborn-client"
  chmod +x "${pkgdir}/usr/bin/minecraft-pi-reborn-client"
  install -Dm644 "${srcdir}/com.thebrokenrail.MCPIRebornClient.desktop" "${pkgdir}/usr/share/applications/com.thebrokenrail.MCPIRebornClient.desktop"
  install -Dm644 "${srcdir}/com.thebrokenrail.MCPIRebornClient.appdata.xml" "${pkgdir}/usr/share/metainfo/com.thebrokenrail.MCPIRebornClient.appdata.xml"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.thebrokenrail.MCPIRebornClient.png"
}

post_install() {
  update-desktop-database -q
}
