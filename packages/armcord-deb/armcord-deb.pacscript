name="armcord-deb"
gives="armcord"
depends=("libgtk-3-0" "libnotify4" "libnss3" "libxss1" "libxtst6" "xdg-utils" "libatspi2.0-0" "libuuid1" "libsecret-1-0")
repology=("project: ${gives}")
version="3.2.1"
if [[ ${CARCH} == "arm64" ]]; then
  hash="00fca1a07959e043ef8b047027a3b0f08ef722932fbe78a8fae2cb5fc1576655"
  arch=("arm64")
else
  hash="f9c0a1a2104697d6632390f6adeb0d210376b9ee7b05968036a6c099ecf5cbb1"
  arch=("amd64")
fi
url="https://eu.armcord.xyz/apt-repo/pool/main/ArmCord_${version}_${CARCH}.deb"
description="Custom client designed to enhance your Discord experience while keeping everything lightweight"
maintainer="Oren Klopfer <oren@taumoda.com>"
