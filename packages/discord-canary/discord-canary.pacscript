name="discord-canary"
version="0.0.119"
maintainer="aranym <aranym1@pm.me>"
url="https://dl-canary.discordapp.net/apps/linux/0.0.119/discord-canary-0.0.119.tar.gz"
build_depends=""
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libappindicator1 libc++1"
gives="discord-canary"
description="Chat for Communities and Friends - Unstable"
hash="517fbe0bdaec2df59213e2fd88ebac157db574eca6244a50864ed6f3148df92f"

prepare() {
        sudo mkdir -p /usr/src/pacstall/discord-canary/usr/share/discord-canary/
        sudo mkdir -p /usr/src/pacstall/discord-canary/usr/share/applications/
        sudo mkdir -p /usr/src/pacstall/discord-canary/usr/share/icons/
}

build() {
        true
}

install() {
        mv discord-canary.desktop /usr/src/pacstall/discord-canary/usr/share/applications/
        cp discord.png /usr/src/pacstall/discord-canary/usr/share/icons/discord-canary.png
        mv ./* /usr/src/pacstall/discord-canary/usr/share/discord-canary/
}
