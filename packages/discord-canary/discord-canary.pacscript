pkgname="discord-canary"
repology=("project: discord-canary")
pkgver="0.0.327"
maintainer=("DismissedGuy <me@mikealmel.ooo>")
source=("https://dl-canary.discordapp.net/apps/linux/${pkgver}/${pkgname}-${pkgver}.tar.gz")
homepage='https://discord.com/'
depends=("libc6" "libasound2" "libatomic1" "libnotify4" "libnspr4" "libnss3" "libstdc++6" "libxss1" "libxtst6" "libc++1" "libatk1.0-0" "libatk-bridge2.0-0" "libcups2" "libdrm2" "libgtk-3-0" "libgbm1")
pkgdesc="Chat for Communities and Friends - Unstable"
arch=('amd64')
sha256sums=("a8c7b282cdc463913e252db466299c0bc5fd185493bf6c5cf270cf4a1eddc75a")

package() {
  cd "${_archive}"
  install -dm644 "${pkgdir}/usr/bin"
  install -dm644 "${pkgdir}/usr/share/${pkgname}"
  ln -sf "/usr/share/${pkgname}/DiscordCanary" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 discord-canary.desktop "${pkgdir}/usr/share/applications/discord-canary.desktop"
  install -Dm755 discord.png "${pkgdir}/usr/share/icons/discord-canary.png"
  cp -R ./* "${pkgdir}/usr/share/${pkgname}/"
}

post_install() {
  if ! [[ -f "${homedir}/.config/discordcanary/settings.json" ]]; then
    mkdir -p "${homedir}/.config/discordcanary/"
    echo '{
    "SKIP_HOST_UPDATE": true
}' > "${homedir}/.config/discordcanary/settings.json"
  fi
}
