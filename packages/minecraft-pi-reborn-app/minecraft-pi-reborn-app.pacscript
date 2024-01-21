name="minecraft-pi-reborn-app"
pkgname="minecraft-pi-reborn"
pkgver="2.5.3"
gives="${pkgname}"
breaks=("${pkgname}-git" "${pkgname}-deb" "${pkgname}-bin" "minecraft-pi-reborn-client")
pkgdesc="Minecraft Pi edition reborn with new features and for x86 pc."
hash="f00e77a85fbab907af274416fb1c4b78216c1c49a992eeeb54378269a5171156"
arch=('amd64')
url="https://gitea.thebrokenrail.com/minecraft-pi-reborn/minecraft-pi-reborn/releases/download/${pkgver}/minecraft-pi-reborn-client-${pkgver}-amd64.AppImage"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
repology=("project: ${pkgname}")

prepare() {
  sudo mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/metainfo" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
}

package() {
  sudo install -Dm644 "minecraft-pi-reborn-client-${pkgver}-amd64.AppImage" "${pkgdir}/usr/bin/minecraft-pi-reborn-client"
  sudo chmod +x "${pkgdir}/usr/bin/minecraft-pi-reborn-client"
  sudo wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/minecraft-pi-reborn-app/com.thebrokenrail.MCPIRebornClient.desktop" -O "${pkgdir}/usr/share/applications/com.thebrokenrail.MCPIRebornClient.desktop"
  sudo wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/minecraft-pi-reborn-app/com.thebrokenrail.MCPIRebornClient.appdata.xml" -O "${pkgdir}/usr/share/metainfo/com.thebrokenrail.MCPIRebornClient.appdata.xml"
  sudo wget -q "https://gitea.thebrokenrail.com/minecraft-pi-reborn/minecraft-pi-reborn/raw/tag/${pkgver}/images/icon.png" -O "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.thebrokenrail.MCPIRebornClient.png"
  sudo update-desktop-database -q
}
