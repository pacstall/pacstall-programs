name="armcord-deb"
gives="armcord"
depends=("libgtk-3-0" "libnotify4" "libnss3" "libxss1" "libxtst6" "xdg-utils" "libatspi2.0-0" "libuuid1" "libsecret-1-0")
repology=("project: ${gives}")
pkgver="3.2.3"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="caa678865f84e0810412e2a17f20d86352f2cf9fcd7a4adff2ec6826bd41f30f"
else
  hash="77c5eff5e717c6450022a092f3654a94b3677b9ea111262f62d483bcdbc6ba5d"
fi
url="https://github.com/ArmCord/ArmCord/releases/download/v${pkgver}/ArmCord_${pkgver}_${CARCH}.deb"
pkgdesc="Custom client designed to enhance your Discord experience while keeping everything lightweight"
maintainer="Oren Klopfer <oren@taumoda.com>"
