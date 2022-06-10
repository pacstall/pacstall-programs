name="discord"
version="0.0.18"
maintainer="aranym <aranym1@pm.me>"
url="https://dl.discordapp.net/apps/linux/$version/$name-$version.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libayatana-appindicator3-1 libc++1"
description="Chat for Communities and Friends"
hash="0417389fa437c6e044d77252de0cffe8473074e596e7b34ba76b1a3a5c0e80c2"

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
