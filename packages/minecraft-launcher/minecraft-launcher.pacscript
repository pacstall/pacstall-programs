name="minecraft-launcher"
version="921"
url="https://launcher.mojang.com/download/linux/x86_64/minecraft-launcher_921.tar.gz"
build_depends=""
depends="dpkg wget ca-certificates default-jre libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libdrm2 libexpat1 libgbm1 libfontconfig1 libgcc1 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango1.0-0 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 libx11-xcb1 libxcb-dri3-0 libxcb1 libbz2-1.0 lsb-base xdg-utils wget libcurl4 libuuid1"
breaks=""
description="Official Minecraft Launcher"
hash="e84cadeb55db50d673bb97d3ad1c9ad52f4e5999ed25fdcf3859cec43b5a449e"

prepare() {
        wget https://gist.githubusercontent.com/aranym0/c752045e3b71bdb5d8c208f57dc12dba/raw/7a6c1864e98c12c64c1cfdbb20cca4cc06b348ae/minecraft-launcher.desktop
        wget https://launcher.mojang.com/download/minecraft-launcher.svg
}

build() {
        true
}

install() {
        ls -l
}
