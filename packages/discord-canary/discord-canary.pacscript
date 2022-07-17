name="discord-canary"
repology=("project: discord-canary")
version="0.0.136"
maintainer="Warofzen <warofzen1@pm.me>"
url="https://dl-canary.discordapp.net/apps/linux/${version}/${name}-${version}.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libayatana-appindicator1 libc++1"
description="Chat for Communities and Friends - Unstable"
hash="3ab1a0e235f389eb0706140e47144437fc2aefbe9180d19a4f28c9355e294805"

prepare() {
        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/${name}/
        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/applications/
        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/icons/
}

build() {
        true
}

install() {
        sudo install -Dm755 discord-canary.desktop "${STOWDIR}/${name}/usr/share/applications/discord-canary.desktop"
        sudo install -Dm755 discord.png "${STOWDIR}/${name}/usr/share/icons/discord.png"
        sudo cp -R ./* "${STOWDIR}/${name}/usr/share/${name}/"
}
