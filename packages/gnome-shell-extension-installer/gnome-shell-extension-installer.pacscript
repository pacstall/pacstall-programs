name="Gnome Shell Extension Installer"
pkgname="gnome-shell-extension-installer"
version="1.7"
description="A bash script to install and search extensions from extensions.gnome.org."
maintainer="D-Brox <BroxZuka@protonmail.com>"
url="https://github.com/brunelli/gnome-shell-extension-installer.git"
depends="curl perl dbus"
pkgdir="/usr/src/pacstall/${pkgname}"
prepare() {
    true
}

build() {
    true
}

install() {
    sudo install -Dm755 gnome-shell-extension-installer -t "${pkgdir}/usr/bin"
    sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    sudo install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}
