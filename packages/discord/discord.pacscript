name="discord"
version="0.0.17"
maintainer="aranym <aranym1@pm.me>"
url="https://dl.discordapp.net/apps/linux/$version/$name-$version.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libappindicator1 libc++1"
description="Chat for Communities and Friends"
hash="3462732e5d5d9bb75f901f7ca5047782fe2f96576b208ea538c593ba2a031315"

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
