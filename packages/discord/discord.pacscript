name="discord"
version="0.0.22"
maintainer="aranym <aranym1@pm.me>"
url="https://dl.discordapp.net/apps/linux/$version/$name-$version.tar.gz"
depends="libc6 libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libstdc++6 libxss1 libxtst6 libayatana-appindicator3-1 libc++1"
description="Chat for Communities and Friends"
hash="175c73771e049ba45e7fb1d37bd107ef0871e3d8857340c5a5a40a745aaeaba7"
repology=("project: ${name}")

prepare() {
        sudo mkdir -p /usr/src/pacstall/discord/usr/share/discord/
        sudo mkdir -p /usr/src/pacstall/discord/usr/share/applications/
        sudo mkdir -p /usr/src/pacstall/discord/usr/share/icons/
}

build() {
        true
}

install() {
        sudo install -Dm755 discord.desktop "${STOWDIR}/${name}/usr/share/applications/discord.desktop"
        sudo install -Dm755 discord.png "${STOWDIR}/${name}/usr/share/icons/discord.png"
        sudo cp -R ./* "${STOWDIR}/${name}/usr/share/discord/"
}
