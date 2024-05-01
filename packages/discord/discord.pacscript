pkgname="discord"
pkgver="0.0.49"
maintainer=("Elsie19 <elsie19@pm.me>")
source=("https://dl.discordapp.net/apps/linux/${pkgver}/${pkgname}-${pkgver}.tar.gz")
homepage='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libayatana-appindicator3-1" "libc++1")
pkgdesc="Chat for Communities and Friends"
sha256sums=("ad54980244d94e5bab9db51e60914282c3dcb02aa32756c99de4108b2866bf04")
arch=('amd64')
repology=("project: ${pkgname}")

package() {
  cd "${_archive}"
  install -dm644 "${pkgdir}/usr/bin"
  install -dm644 "${pkgdir}/usr/share/discord"
  ln -sf /usr/share/discord/Discord "${pkgdir}/usr/bin/discord"
  install -Dm755 discord.desktop "${pkgdir}/usr/share/applications/discord.desktop"
  install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord.png"
  cp -R ./* "${pkgdir}/usr/share/discord/"
}
