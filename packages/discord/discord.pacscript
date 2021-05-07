name="discord"
version="0.0.14"
maintainer="aranym <aranym1@pm.me>"
url="https://dl.discordapp.net/apps/linux/0.0.14/discord-0.0.14.tar.gz"
build_depends=""
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libappindicator1 libc++1"
gives="discord"
description="Chat for Communities and Friends"
hash="c2651aef4b2c078a3d0975b82fd391571decaa636e52343bb4f116da1c4804e7"

prepare() {
        sudo mkdir -p /usr/src/pacstall/discord/usr/share/discord/
        sudo mkdir -p /usr/src/pacstall/discord/usr/share/applications/
        sudo mkdir -p /usr/src/pacstall/discord/usr/share/icons/
}

build() {
        true
}

install() {
        mv discord.desktop /usr/src/pacstall/discord/usr/share/applications/
        cp discord.png /usr/src/pacstall/discord/usr/share/icons/
        mv ./* /usr/src/pacstall/discord/usr/share/discord/
}
