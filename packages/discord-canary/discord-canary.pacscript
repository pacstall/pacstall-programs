name="discord-canary"
version="0.0.132"
maintainer="aranym <aranym1@pm.me>"
url="https://dl-canary.discordapp.net/apps/linux/${version}/${name}-${version}.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libappindicator1 libc++1"
description="Chat for Communities and Friends - Unstable"
hash="db4359c9de40418e86b127c03cc2fb1b1440f9ed5495d79dbd8d3d4a716a4bca"

prepare() {
        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/${name}/
        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/applications/
        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/icons/
}

build() {
        true
}

install() {
        sudo mv ${name}.desktop /usr/src/pacstall/${name}/usr/share/applications/
        sudo cp discord.png /usr/src/pacstall/${name}/usr/share/icons/${name}.png
        sudo mv ./* /usr/src/pacstall/${name}/usr/share/${name}/
}
