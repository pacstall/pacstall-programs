name="smartgit"
version="22.1.0"
url="https://www.syntevo.com/downloads/smartgit/smartgit-linux-22_1_2.tar.gz"
depends="git libgtk-3-0 libcurl4"
description="Graphical Git client with support for GitHub, Bitbucket and GitLab"
hash="8bff52a2f07cb9b412d74a5c746b02d9c15ca7b6a05122da7258d843142d5fe9"
maintainer="echometerain <echometer@disroot.org>"
removescript="true"
repology=("project: smartgit")

prepare() {
    true
}

build() {
    true
}

install() {
    sudo install -Dm755 "./licenses"/* -t "$STOWDIR/$name/usr/share/licenses/$name"
    sudo install -Dm755 "./license.html" -t "$STOWDIR/$name/usr/share/licenses/$name"
    sudo mkdir -p "$STOWDIR/$name/opt"
    sudo cp -r "$SRCDIR/$name" -t "$STOWDIR/$name/opt"
    sudo chmod 755 "$STOWDIR/$name/opt"

    for _size in 32 48 64 128 256; do
        sudo chmod 755 "./bin/smartgit-${_size}.png"
        sudo mkdir -p "$STOWDIR/$name/usr/share/icons/hicolor/${_size}x${_size}/apps"
        sudo mv "./bin/smartgit-${_size}.png" "$STOWDIR/$name/usr/share/icons/hicolor/${_size}x${_size}/apps/$name.png"
    done

    sudo chmod 755 "$STOWDIR/$name/opt/$name/bin/smartgit.sh"
}

postinst() {
    sudo ln -s "/opt/$name/bin/smartgit.sh" "/usr/bin/smartgit"
}

removescript() {
    sudo rm "/usr/bin/smartgit"
}
