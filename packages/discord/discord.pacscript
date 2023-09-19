name="discord"
pkgver="0.0.30"
maintainer="Elsie19 <elsie19@pm.me>"
url="https://dl.discordapp.net/apps/linux/${pkgver}/${name}-${pkgver}.tar.gz"
homepage='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libayatana-appindicator3-1" "libc++1")
pkgdesc="Chat for Communities and Friends"
hash="7827c5ef30bd24cff2d78a2f489c4c22f2d8f881afd09bf39fb31582e7a5b4db"
arch=('amd64')
repology=("project: ${name}")

prepare() {
  sudo mkdir -p "${pkgdir}/usr/share/discord/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo mkdir -p "${pkgdir}/usr/share/icons/"
}

package() {
  sudo install -Dm755 discord.desktop "${pkgdir}/usr/share/applications/discord.desktop"
  sudo install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord.png"
  sudo cp -R ./* "${pkgdir}/usr/share/discord/"
}
