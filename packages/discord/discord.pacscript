pkgname="discord"
pkgver="0.0.82"
maintainer=("Elsie19 <elsie19@pm.me>")
source=("@${pkgname}~${pkgver}::https://dl.discordapp.net/apps/linux/${pkgver}/${pkgname}-${pkgver}.tar.gz")
url='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libayatana-appindicator3-1" "libc++1")
pkgdesc="Chat for Communities and Friends"
sha256sums=("2fc2f07b951abe66d6d6cde0b122621e36e266736dc84b0427396b374160737c")
arch=('amd64')
repology=("project: ${pkgname}")

package() {
  cd "${pkgname}~${pkgver}"
  install -dm644 "${pkgdir}/usr/bin"
  install -dm644 "${pkgdir}/usr/share/discord"
  ln -sf /usr/share/discord/Discord "${pkgdir}/usr/bin/discord"
  install -Dm755 discord.desktop "${pkgdir}/usr/share/applications/discord.desktop"
  install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord.png"
  cp -R ./* "${pkgdir}/usr/share/discord/"
}
