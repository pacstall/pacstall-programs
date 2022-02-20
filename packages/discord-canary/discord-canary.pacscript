name="discord-canary"
version="0.0.133"
maintainer="aranym <aranym1@pm.me>"
url="https://dl-canary.discordapp.net/apps/linux/${version}/${name}-${version}.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libayatana-appindicator1 libc++1"
description="Chat for Communities and Friends - Unstable"
hash="0aac162de74f8782825c440018cd2516503250b46d28b5480289ef3fdfe4a873"

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
