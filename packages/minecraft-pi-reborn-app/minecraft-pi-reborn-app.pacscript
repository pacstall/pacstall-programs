name="minecraft-pi-reborn-app"
pkgname="minecraft-pi-reborn"
version="2.3.8"
gives="${pkgname}"
breaks="${pkgname}-git ${pkgname}-deb ${pkgname}-bin minecraft-pi-reborn-client"
description="Minecraft Pi edition reborn with new features and for x86 pc."
hash="7b81e4787a79840fa0434179c8dd288abb21924c8543b61049430ec94068e9ad"
url="https://jenkins.thebrokenrail.com/job/minecraft-pi-reborn/job/master/202/artifact/out/minecraft-pi-reborn-client-${version}-amd64.AppImage"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"

prepare() {
  sudo mkdir -p "${STOWDIR}/${name}/usr/bin" "${STOWDIR}/${name}/usr/share/metainfo" "${STOWDIR}/${name}/usr/share/applications" "${STOWDIR}/${name}/usr/share/icons/hicolor/256x256/apps"
}

build() {
  true
}

install() {
  sudo install -Dm644 minecraft-pi-reborn-client-${version}-amd64.AppImage "${STOWDIR}/${name}/usr/bin/minecraft-pi-reborn-client"
  sudo chmod +x "${STOWDIR}/${name}/usr/bin/minecraft-pi-reborn-client"
  sudo wget -q "https://gitea.thebrokenrail.com/TheBrokenRail/minecraft-pi-reborn/raw/tag/${version}/launcher/data/client/share/applications/com.thebrokenrail.MCPIRebornClient.desktop" -O "${STOWDIR}/${name}/usr/share/applications/com.thebrokenrail.MCPIRebornClient.desktop"
  sudo wget -q "https://gitea.thebrokenrail.com/TheBrokenRail/minecraft-pi-reborn/raw/tag/${version}/launcher/data/client/share/metainfo/com.thebrokenrail.MCPIRebornClient.appdata.xml" -O "${STOWDIR}/${name}/usr/share/metainfo/com.thebrokenrail.MCPIRebornClient.appdata.xml"
  sudo wget -q "https://gitea.thebrokenrail.com/TheBrokenRail/minecraft-pi-reborn/raw/tag/${version}/launcher/data/com.thebrokenrail.MCPIReborn.png" -O "${STOWDIR}/${name}/usr/share/icons/hicolor/256x256/apps/com.thebrokenrail.MCPIRebornClient.png"
  sudo update-desktop-database -q
}
