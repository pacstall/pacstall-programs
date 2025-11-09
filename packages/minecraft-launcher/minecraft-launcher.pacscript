pkgname="minecraft-launcher"
gives="minecraft-launcher"
pkgver="1121"
maintainer=("aranym <aranym1@pm.me>")
source=(
  "@${pkgname}~${pkgver}::https://launcher.mojang.com/download/linux/x86_64/minecraft-launcher_1121.tar.gz"
  "minecraft-launcher.svg::https://launcher.mojang.com/download/minecraft-launcher.svg"
  "minecraft-launcher.desktop::https://aur.archlinux.org/cgit/aur.git/plain/minecraft-launcher.desktop?h=minecraft-launcher"
)
depends=("wget" "ca-certificates" "default-jre" "libasound2" "libatk-bridge2.0-0" "libatk1.0-0" "libatspi2.0-0" "libc6" "libcairo2" "libcups2" "libdbus-1-3" "libdrm2" "libexpat1" "libgbm1" "libfontconfig1" "libgcc1" "libgdk-pixbuf-2.0-0" "libglib2.0-0" "libgtk-3-0" "libnspr4" "libnss3" "libpango-1.0-0" "libpangocairo-1.0-0" "libstdc++6" "libx11-6" "libxcomposite1" "libxcursor1" "libxdamage1" "libxext6" "libxfixes3" "libxi6" "libxrandr2" "libxrender1" "libxss1" "libxtst6" "libx11-xcb1" "libxcb-dri3-0" "libxcb1" "libbz2-1.0" "lsb-base" "xdg-utils" "wget" "libcurl4" "libuuid1")
pkgdesc="Official Minecraft Launcher"
arch=('amd64')
sha256sums=(
  "b08cb0cb52425afbafdd52a6b2c7d0d94ce0a2d9285f72f47ec2fcdc31e7e0cf"
  "SKIP"
  "SKIP"
)

prepare() {
  cd "${pkgname}~${pkgver}"
}

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
  mkdir -p "${pkgdir}/usr/share/applications"
  chmod +x minecraft-launcher
  mv minecraft-launcher "${pkgdir}/usr/bin"
  mv "${srcdir}"/minecraft-launcher.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
  mv "${srcdir}"/minecraft-launcher.desktop "${pkgdir}/usr/share/applications"
}
