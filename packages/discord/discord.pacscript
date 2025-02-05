pkgname="discord"
pkgver="0.0.84"
maintainer=("Elsie19 <elsie19@pm.me>")
source=("@${pkgname}~${pkgver}::https://dl.discordapp.net/apps/linux/${pkgver}/${pkgname}-${pkgver}.tar.gz")
url='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libayatana-appindicator3-1" "libc++1")
pkgdesc="Chat for Communities and Friends"
sha256sums=("19bc5af187a48f1f1adc190f05f50074b5b981d9eadd631cc16debcd58198e88")
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
