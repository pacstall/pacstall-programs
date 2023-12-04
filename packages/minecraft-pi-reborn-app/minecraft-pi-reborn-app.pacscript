name="minecraft-pi-reborn-app"
gives="minecraft-pi-reborn"
pkgver="2.4.8"
breaks=("${gives}-git" "${gives}-deb" "${gives}-bin" "${gives}-client")
pkgdesc="Minecraft Pi edition reborn with new features and for x86 pc."
hash="06f2e8b240f211940961144cd2b6461827cfb11b2b517828385527516f69d8fc"
arch=('amd64')
url="https://jenkins.thebrokenrail.com/job/minecraft-pi-reborn/job/master/258/artifact/out/minecraft-pi-reborn-client-${pkgver}-amd64.AppImage"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
repology=("project: ${gives}")

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
