name="Gnome Shell Extension Installer"
pkgname="gnome-shell-extension-installer"
version="1.7"
description="A bash script to install and search extensions from extensions.gnome.org."
maintainer="D-Brox <BroxZuka@protonmail.com>"
url="https://github.com/brunelli/gnome-shell-extension-installer.git"
build_depends="perl dbus"
breaks="gnome-shell-extension-installer"
gives="gnome-shell-extension-installer"[
prepare() {
    true
}

build() {
    chmod +x gnome-shell-extension-installer
}

install() {
    sudo mkdir -p /usr/src/pacstall/${pkgname}/usr/bin/
    sudo cp gnome-shell-extension-installer /usr/src/pacstall/${pkgname}/usr/bin
}
