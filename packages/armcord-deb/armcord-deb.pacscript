name="armcord-deb"
gives="armcord"
depends=("libgtk-3-0" "libnotify4" "libnss3" "libxss1" "libxtst6" "xdg-utils" "libatspi2.0-0" "libuuid1" "libsecret-1-0")
repology=("project: ${gives}")
pkgver="3.2.4"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="4d65651236a4751c9998eb81abd1cb3be47bcb98e682cb45b721078dff27c713"
else
  hash="2141dc0c7209786c7b40a8f19777d4147a947ecd497481717acbc35edde6570d"
fi
url="https://github.com/ArmCord/ArmCord/releases/download/v${pkgver}/ArmCord_${pkgver}_${CARCH}.deb"
pkgdesc="Custom client designed to enhance your Discord experience while keeping everything lightweight"
maintainer="Oren Klopfer <oren@taumoda.com>"
