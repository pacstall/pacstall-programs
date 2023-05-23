name="armcord-deb"
gives="armcord"
depends=("libgtk-3-0" "libnotify4" "libnss3" "libxss1" "libxtst6" "xdg-utils" "libatspi2.0-0" "libuuid1" "libsecret-1-0")
repology=("project: ${gives}")
version="3.2.0"
if [[ ${CARCH} == "arm64" ]]; then
  hash="6b9a8b2bc5a3ae598a176e14f52884a58f92356b877fa807241ca6e4833c1d9e"
  arch=("arm64")
else
  hash="ee54faf5f53bb46ba385b0d35f4b58a6412aba8b3030264e18052193636bf82d"
  arch=("amd64")
fi
url="https://eu.armcord.xyz/apt-repo/pool/main/ArmCord_${version}_${CARCH}.deb"
description="Custom client designed to enhance your Discord experience while keeping everything lightweight"
maintainer="Oren Klopfer <oren@taumoda.com>"
