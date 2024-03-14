name="discord"
pkgver="0.0.42"
maintainer="Elsie19 <elsie19@pm.me>"
url="https://dl.discordapp.net/apps/linux/${pkgver}/${name}-${pkgver}.tar.gz"
homepage='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libayatana-appindicator3-1" "libc++1")
pkgdesc="Chat for Communities and Friends"
hash="edc6a7d7926105ce8e240599324f2e11db7f0f5a2b08a1b530dd5605d4d9ac8d"
arch=('amd64')
repology=("project: ${name}")

package() {
  sudo install -dm644 "${pkgdir}/usr/bin"
  sudo install -dm644 "${pkgdir}/usr/share/discord"
  sudo ln -s /usr/share/discord/Discord "${pkgdir}/usr/bin/discord"
  sudo install -Dm755 discord.desktop "${pkgdir}/usr/share/applications/discord.desktop"
  sudo install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord.png"
  sudo cp -R ./* "${pkgdir}/usr/share/discord/"
}
