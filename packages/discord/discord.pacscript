name="discord"
version="0.0.27"
maintainer="Henryws <hwengerstickel@pm.me>"
url="https://dl.discordapp.net/apps/linux/${version}/${name}-${version}.tar.gz"
homepage='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libgconf-2-4" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libayatana-appindicator3-1" "libc++1")
description="Chat for Communities and Friends"
hash="e9f1da88f05cbfb4d0561f936ad20461767f2f03e69c2994fd059728581447b5"
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
