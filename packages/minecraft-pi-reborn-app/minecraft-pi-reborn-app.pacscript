name="minecraft-pi-reborn-app"
pkgname="minecraft-pi-reborn"
pkgver="2.5.3"
gives="${pkgname}"
breaks=("${pkgname}-git" "${pkgname}-deb" "${pkgname}-bin" "minecraft-pi-reborn-client")
pkgdesc="Minecraft Pi edition reborn with new features and for x86 pc."
hash=(
  "f00e77a85fbab907af274416fb1c4b78216c1c49a992eeeb54378269a5171156"
  "SKIP" "SKIP" "SKIP"
)
arch=('amd64')
source=(
  "https://gitea.thebrokenrail.com/minecraft-pi-reborn/minecraft-pi-reborn/releases/download/${pkgver}/minecraft-pi-reborn-client-${pkgver}-amd64.AppImage"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/minecraft-pi-reborn-app/com.thebrokenrail.MCPIRebornClient.desktop"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/minecraft-pi-reborn-app/com.thebrokenrail.MCPIRebornClient.appdata.xml"
  "https://gitea.thebrokenrail.com/minecraft-pi-reborn/minecraft-pi-reborn/raw/tag/${pkgver}/images/icon.png"
)
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
repology=("project: ${pkgname}")

package() {
  sudo install -Dm755 "minecraft-pi-reborn-client-${pkgver}-amd64.AppImage" "${pkgdir}/usr/bin/minecraft-pi-reborn-client"
  sudo install -Dm644 com.thebrokenrail.MCPIRebornClient.desktop -t "${pkgdir}/usr/share/applications"
  sudo install -Dm644 com.thebrokenrail.MCPIRebornClient.appdata.xml -t "${pkgdir}/usr/share/metainfo"
  sudo install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.thebrokenrail.MCPIRebornClient.png"
  sudo update-desktop-database -q
}
