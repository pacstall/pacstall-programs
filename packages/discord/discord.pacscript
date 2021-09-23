name="discord"
version="0.0.16"
maintainer="aranym <aranym1@pm.me>"
url="https://dl.discordapp.net/apps/linux/$version/$name-$version.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libappindicator1 libc++1"
description="Chat for Communities and Friends"
hash="51354a8ecfe2ec2fe6f35e356d706c6a441115dfdcfff126aaa84a864af538e9"

prepare() {
        sudo mkdir -p /usr/src/pacstall/discord/usr/share/discord/
        sudo mkdir -p /usr/src/pacstall/discord/usr/share/applications/
        sudo mkdir -p /usr/src/pacstall/discord/usr/share/icons/
}

build() {
        true
}

install() {
        sudo mv discord.desktop /usr/src/pacstall/discord/usr/share/applications/
        sudo cp discord.png /usr/src/pacstall/discord/usr/share/icons/
        sudo mv ./* /usr/src/pacstall/discord/usr/share/discord/
}
