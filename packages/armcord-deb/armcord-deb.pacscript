name="armcord-deb"
gives="armcord"
depends=("libgtk-3-0" "libnotify4" "libnss3" "libxss1" "libxtst6" "xdg-utils" "libatspi2.0-0" "libuuid1" "libsecret-1-0")
repology=("project: ${gives}")
pkgver="3.2.5"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="1c9bb59516b7cce4e886c3cc7b6de9b87c60d55316351d9a3a30d026a7384ea1"
else
  hash="eb39589b8c6e6291be060b2ae52f81fd9b7d4d10761999ee78a020db2c182c4e"
fi
url="https://github.com/ArmCord/ArmCord/releases/download/v${pkgver}/ArmCord_${pkgver}_${CARCH}.deb"
pkgdesc="Custom client designed to enhance your Discord experience while keeping everything lightweight"
maintainer="Oren Klopfer <oren@taumoda.com>"
