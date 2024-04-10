name="discord"
pkgver="0.0.48"
maintainer="Elsie19 <elsie19@pm.me>"
url="https://dl.discordapp.net/apps/linux/${pkgver}/${name}-${pkgver}.tar.gz"
homepage='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libayatana-appindicator3-1" "libc++1")
pkgdesc="Chat for Communities and Friends"
hash="760946aa2d1a2935155b20e5e548dd04bff5f4150110dee1da683dafa6d669c8"
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
