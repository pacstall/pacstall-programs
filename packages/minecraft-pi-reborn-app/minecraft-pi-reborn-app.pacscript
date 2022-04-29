name="minecraft-pi-reborn-app"
pkgname="minecraft-pi-reborn"
version="2.3.5"
gives="${pkgname}"
breaks="${pkgname}-git ${pkgname}-deb ${pkgname}-bin minecraft-pi-reborn-client"
description="Minecraft Pi edition reborn with new features and for x86 pc."
hash="c526ab6ce89d3ee3feebfc212f2c122dfd9a03d580122494f14fe9056c0b368d"
url="https://jenkins.thebrokenrail.com/job/minecraft-pi-reborn/job/master/lastStableBuild/artifact/out/minecraft-pi-reborn-client-${version}-amd64.AppImage"
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
