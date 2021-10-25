name="discord-canary"
version="0.0.131"
maintainer="aranym <aranym1@pm.me>"
url="https://dl-canary.discordapp.net/apps/linux/$version/$name-$version.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libappindicator1 libc++1"
description="Chat for Communities and Friends - Unstable"
hash="6583dd134d89abbf4b9af5eeeca20916e8095fef8d9e3d0e83f981b9a3fff920"

prepare() {
        sudo mkdir -p /usr/src/pacstall/discord-canary/usr/share/discord-canary/
        sudo mkdir -p /usr/src/pacstall/discord-canary/usr/share/applications/
        sudo mkdir -p /usr/src/pacstall/discord-canary/usr/share/icons/
}

build() {
        true
}

install() {
        sudo mv discord-canary.desktop /usr/src/pacstall/discord-canary/usr/share/applications/
        sudo cp discord.png /usr/src/pacstall/discord-canary/usr/share/icons/discord-canary.png
        sudo mv ./* /usr/src/pacstall/discord-canary/usr/share/discord-canary/
}
