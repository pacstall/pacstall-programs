name="minecraft-launcher"
gives="minecraft-launcher"
pkgver="1121"
maintainer="aranym <aranym1@pm.me>"
url="https://launcher.mojang.com/download/linux/x86_64/minecraft-launcher_1121.tar.gz"
depends=("wget" "ca-certificates" "default-jre" "libasound2" "libatk-bridge2.0-0" "libatk1.0-0" "libatspi2.0-0" "libc6" "libcairo2" "libcups2" "libdbus-1-3" "libdrm2" "libexpat1" "libgbm1" "libfontconfig1" "libgcc1" "libgdk-pixbuf2.0-0" "libglib2.0-0" "libgtk-3-0" "libnspr4" "libnss3" "libpango1.0-0" "libpango-1.0-0" "libpangocairo-1.0-0" "libstdc++6" "libx11-6" "libxcomposite1" "libxcursor1" "libxdamage1" "libxext6" "libxfixes3" "libxi6" "libxrandr2" "libxrender1" "libxss1" "libxtst6" "libx11-xcb1" "libxcb-dri3-0" "libxcb1" "libbz2-1.0" "lsb-base" "xdg-utils" "wget" "libcurl4" "libuuid1")
pkgdesc="Official Minecraft Launcher"
arch=('amd64')
hash="b08cb0cb52425afbafdd52a6b2c7d0d94ce0a2d9285f72f47ec2fcdc31e7e0cf"

prepare() {
  wget -q "https://aur.archlinux.org/cgit/aur.git/plain/minecraft-launcher.desktop?h=minecraft-launcher" -O minecraft-launcher.desktop
  wget -q https://launcher.mojang.com/download/minecraft-launcher.svg
}

package() {
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mkdir -p "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
  sudo mkdir -p "${pkgdir}/usr/share/applications"
  chmod +x minecraft-launcher
  sudo mv minecraft-launcher "${pkgdir}/usr/bin"
  sudo mv minecraft-launcher.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
  sudo mv minecraft-launcher.desktop "${pkgdir}/usr/share/applications"
}
