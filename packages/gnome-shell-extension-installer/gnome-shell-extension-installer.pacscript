name="gnome-shell-extension-installer"
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
    install -Dm755 "${name}" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"
    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
}

removescript () {
    rm -rf "/usr/share/licenses/${name}"
    rm -rf "/usr/share/doc/${name}"
}
