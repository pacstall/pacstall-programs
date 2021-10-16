name="gnome-shell-extension-installer-git"
gives="gnome-shell-extension-installer"
version="1.7"
description="A bash script to install and search extensions from extensions.gnome.org."
url="https://github.com/brunelli/gnome-shell-extension-installer.git"
maintainer="D-Brox <BroxZuka@protonmail.com>"
depends="curl perl dbus"
pkgdir="/usr/src/pacstall/${name}"
removescript="yes"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo install -Dm755 "${name}" -t "${pkgdir}/usr/bin"
    sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"
    sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
}

removescript () {
    sudo rm -rf "/usr/share/licenses/${name}"
    sudo rm -rf "/usr/share/doc/${name}"
}
