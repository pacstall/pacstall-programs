name="minecraft-launcher"
pkgname="minecraft-launcher"
version="921"
maintainer="aranym <aranym1@pm.me>"
url="https://launcher.mojang.com/download/linux/x86_64/minecraft-launcher_921.tar.gz"
depends="dpkg wget ca-certificates default-jre libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libdrm2 libexpat1 libgbm1 libfontconfig1 libgcc1 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango1.0-0 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 libx11-xcb1 libxcb-dri3-0 libxcb1 libbz2-1.0 lsb-base xdg-utils wget libcurl4 libuuid1"
description="Official Minecraft Launcher"
hash="e84cadeb55db50d673bb97d3ad1c9ad52f4e5999ed25fdcf3859cec43b5a449e"

prepare() {
        wget -q https://gist.githubusercontent.com/aranym0/c752045e3b71bdb5d8c208f57dc12dba/raw/4aa522fe02cd827300ce102b3d5f38ba38798a9c/minecraft-launcher.desktop
        wget -q https://launcher.mojang.com/download/minecraft-launcher.svg
}

build() {
        true
}

install() {
        sudo mkdir -p /usr/src/pacstall/minecraft-launcher/usr/bin
        sudo mkdir -p /usr/src/pacstall/minecraft-launcher/usr/share/icons/hicolor/symbolic/apps
        sudo mkdir -p /usr/src/pacstall/minecraft-launcher/usr/share/applications
        chmod +x minecraft-launcher
        sudo mv minecraft-launcher /usr/src/pacstall/minecraft-launcher/usr/bin
        sudo mv minecraft-launcher.svg /usr/src/pacstall/minecraft-launcher/usr/share/icons/hicolor/symbolic/apps
        sudo mv minecraft-launcher.desktop /usr/src/pacstall/minecraft-launcher/usr/share/applications
}
