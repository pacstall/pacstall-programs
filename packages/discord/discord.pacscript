pkgname="discord"
pkgver="0.0.96"
maintainer=("Elsie19 <elsie19@pm.me>")
source=("@${pkgname}~${pkgver}::https://dl.discordapp.net/apps/linux/${pkgver}/${pkgname}-${pkgver}.tar.gz")
url='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libayatana-appindicator3-1" "libc++1")
optdepends=(
  "fonts-noto-color-emoji: emoji support"
)
pkgdesc="Chat for Communities and Friends"
sha256sums=("2b885df8aa69310726f46149e39c42d48eda8f14b53aae605b5d7fa6410c4c0c")
arch=('amd64')
repology=("project: ${pkgname}")

prepare() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/discord"
}

package() {
  cd "${pkgname}~${pkgver}"

  cp -R ./* "${pkgdir}/usr/share/discord/"

  ln -sf "/usr/share/discord/Discord" "${pkgdir}/usr/bin/discord"
  install -Dm755 discord.desktop "${pkgdir}/usr/share/applications/discord.desktop"
  install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord.png"
}
