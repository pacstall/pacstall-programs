name="minecraft-pi-reborn-app"
pkgname="minecraft-pi-reborn"
version="2.4.3"
gives="${pkgname}"
breaks="${pkgname}-git ${pkgname}-deb ${pkgname}-bin minecraft-pi-reborn-client"
description="Minecraft Pi edition reborn with new features and for x86 pc."
hash="d55fb2107008c214c4069b47cc73c784f7302d520881885bfeea007292f3454c"
url="https://jenkins.thebrokenrail.com/job/minecraft-pi-reborn/job/master/237/artifact/out/minecraft-pi-reborn-client-${version}-amd64.AppImage"
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
  sudo wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/minecraft-pi-reborn-app/com.thebrokenrail.MCPIRebornClient.desktop" -O "${STOWDIR}/${name}/usr/share/applications/com.thebrokenrail.MCPIRebornClient.desktop"
  sudo wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/minecraft-pi-reborn-app/com.thebrokenrail.MCPIRebornClient.appdata.xml" -O "${STOWDIR}/${name}/usr/share/metainfo/com.thebrokenrail.MCPIRebornClient.appdata.xml"
  sudo wget -q "https://gitea.thebrokenrail.com/minecraft-pi-reborn/minecraft-pi-reborn/raw/tag/${version}/images/icon.png" -O "${STOWDIR}/${name}/usr/share/icons/hicolor/256x256/apps/com.thebrokenrail.MCPIRebornClient.png"
  sudo update-desktop-database -q
}
