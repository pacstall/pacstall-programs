name="discord-canary"
version="0.0.129"
maintainer="aranym <aranym1@pm.me>"
url="https://dl-canary.discordapp.net/apps/linux/$version/$name-$version.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libappindicator1 libc++1"
description="Chat for Communities and Friends - Unstable"
hash="73f237309a186070ef2ed02134fefd1088b184b4be3ef9b3ef890f33dade89f4"

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
