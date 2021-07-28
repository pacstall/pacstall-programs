name="lyrebird"
pkgver="1.1.0"
pkgdesc="Simple and powerful voice changer for Linux, written in GTK 3"
url="https://github.com/lyrebird-voice-changer/lyrebird.git"
maintainer="D-Brox <BroxZuka@protonmail.com>"
depends="python3 libgtk-3-dev python3-gi python3-gi-cairo gir1.2-gtk-3.0 sox libsox-fmt-pulse pulseaudio"
build_depends="python3-pip"
pkgdir="/usr/src/pacstall/${name}"
removescript="yes"

prepare() {
    sudo pip3 -q install toml
}

build() {
    true
}

install() {
    sudo cp -rf "app/" "${pkgdir}/usr/share/${name}"
    sudo install -Dm644 "icon.png" -t "${pkgdir}/usr/share/${name}"
    sudo install -Dm644 "app.py" -t "${pkgdir}/usr/share/${name}"
    sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"
    sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
    sudo install -Dm755 "${name}" -t "${pkgdir}/usr/bin"
}

removescript () {
    sudo rm -rf "/usr/share/${name}"
    sudo rm -rf "/usr/share/licenses/${name}"
    sudo rm -rf "/usr/share/doc/${name}"
}

