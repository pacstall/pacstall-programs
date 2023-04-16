name="discord-canary"
repology=("project: discord-canary" "repo: aur")
version="0.0.150"
maintainer="DismissedGuy <me@mikealmel.ooo>"
url="https://dl-canary.discordapp.net/apps/linux/${version}/${name}-${version}.tar.gz"
homepage='https://discord.com/'
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libayatana-appindicator1 libc++1"
description="Chat for Communities and Friends - Unstable"
arch=('amd64')
hash="f21b83a75bb4b7dfe465b781edb3ea414c3cf8743aac8cb3298515374da041fa"

prepare() {
  sudo mkdir -p "${pkgdir}/usr/share/${name}/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo mkdir -p "${pkgdir}/usr/share/icons/"
}

install() {
  sudo install -Dm755 discord-canary.desktop "${pkgdir}/usr/share/applications/discord-canary.desktop"
  sudo install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord-canary.png"
  sudo cp -R ./* "${pkgdir}/usr/share/${name}/"
}
