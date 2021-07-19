name="Gnome Shell Extension Installer"
pkgname="gnome-shell-extension-installer"
version="1.7"
description="A bash script to install and search extensions from extensions.gnome.org."
url="https://github.com/brunelli/gnome-shell-extension-installer.git"
maintainer="D-Brox <BroxZuka@protonmail.com>"
depends="curl perl dbus"
pkgdir="/usr/src/pacstall/${pkgname}"
removescript="yes"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
    sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

removescript () {
    sudo rm -rf "/usr/share/licenses/${pkgname}"
    sudo rm -rf "/usr/share/doc/${pkgname}"
}
