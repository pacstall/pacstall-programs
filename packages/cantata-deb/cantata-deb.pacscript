name="cantata-deb"
pkgname="cantata-deb"
version="2.4.2"
url="https://launchpad.net/~ubuntuhandbook1/+archive/ubuntu/cantata-qt"
license="GPL"
depends="mpd media-player-info fonts-font-awesome libcddb2 libebur128-1 libmusicbrainz5cc2v5 libqt5multimedia5"
gives="cantata-deb"
description="Cantata is a graphical client for MPD. It is support for Linux, MacOSX, and Windows, Multiple MPD collections and it has a Highly customizable layout."

prepare() {
          sudo add-apt-repository ppa:ubuntuhandbook1/cantata-qt -y
          sudo apt-get update
}

install() {
    sudo pckon install cantata -y
}
