name="armcord-deb"
gives="armcord"
depends="libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libuuid1 libsecret-1-0"
repology=("project: ${gives}")
version="3.1.7"
if [[ ${CARCH} == "arm64" ]]; then
  hash="e32a9ee1e20ee00c6c64d6029fdf4a4c1aa3414441f86fa0a53d10d7ba5c12f5"
  arch=("arm64");
else
  hash="7347a34a2bd06f1a4f510e8fd185326b7ab5109d721784451aeaf5d41330cf7a"
  arch=("amd64");
fi
url="https://eu.armcord.xyz/apt-repo/pool/main/ArmCord_${version}_${CARCH}.deb"
description="Custom client designed to enhance your Discord experience while keeping everything lightweight"
maintainer="Oren Klopfer <oren@taumoda.com>"
