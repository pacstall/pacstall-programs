name="discord"
version="0.0.25"
maintainer="Henryws <hwengerstickel@pm.me>"
url="https://dl.discordapp.net/apps/linux/${version}/${name}-${version}.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libayatana-appindicator3-1 libc++1"
description="Chat for Communities and Friends"
hash="581726cbd7f018fab756cd7eee520e47b3a25bf7749193482a9e10e4d458042c"
arch=('amd64')
repology=("project: ${name}")

prepare() {
  sudo mkdir -p "${pkgdir}/usr/share/discord/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo mkdir -p "${pkgdir}/usr/share/icons/"
}

install() {
  sudo install -Dm755 discord.desktop "${pkgdir}/usr/share/applications/discord.desktop"
  sudo install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord.png"
  sudo cp -R ./* "${pkgdir}/usr/share/discord/"
}
