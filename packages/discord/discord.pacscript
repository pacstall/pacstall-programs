name="discord"
version="0.0.15"
maintainer="aranym <aranym1@pm.me>"
url="https://dl.discordapp.net/apps/linux/0.0.15/discord-0.0.15.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libappindicator1 libc++1"
description="Chat for Communities and Friends"
hash="adede954e9c696d96e254759b539527a24ab1d42f0d548c5c4309d1a3fc3c25e"

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
