name="smartgit"
version="21.1.0"
url="https://www.syntevo.com/downloads/smartgit/smartgit-linux-21_2_2.tar.gz"
depends="git libgtk-3-0 openjdk-11-jre libcurl4"
replace="alacritty"
hash="c3e2672e98190cb72060e27fa26232b7f4b6ffcf62eaf1d01e7ec94ac1d36683"
maintainer="echometerain <echometer@disroot.org>"
removescript="true"

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
    sudo ln -s "$STOWDIR/$name/opt/$name/bin/smartgit.sh" "/usr/bin/smartgit"
}

removescript() {
    sudo rm "/usr/bin/smartgit"
}
