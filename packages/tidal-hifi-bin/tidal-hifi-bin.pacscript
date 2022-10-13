name="tidal-hifi-bin"
pkgname="tidal-hifi"
version="4.2.0"
description="The web version of listen.tidal.com running in electron with hifi support thanks to widevine"
repology=("project: tidal-hifi" "visiblename: tidal-hifi-bin")
url="https://github.com/Mastermindzh/tidal-hifi/releases/download/${version}/tidal-hifi-${version}.tar.gz"
hash="21c4fcbba2a9b56201f3005151c420e1887f40f3890e67f81f3fee06ac93758e"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"

depends="libxss1 libnss3 libgtk-3-0"

prepare() {
    true
}

build() {
    true
}

install() {
    # Get icon from github and install it
    wget -q "https://github.com/Mastermindzh/tidal-hifi/raw/master/build/icon.png"
    sudo install -Dm644 icon.png "${STOWDIR}/${name}/usr/share/pixmaps/${pkgname}.png"

    # Get desktop file and install it
    wget -q "https://aur.archlinux.org/cgit/aur.git/plain/tidal-hifi.desktop?h=tidal-hifi-bin" -O tidal-hifi.desktop
    sudo install -Dm644 tidal-hifi.desktop -t "${STOWDIR}/${name}/usr/share/applications"

    # Install the rest of the app
    sudo install -d "${STOWDIR}/${name}/opt/${pkgname}/" "${STOWDIR}/${name}/usr/bin"

    sudo cp -r ${SRCDIR}/tidal-hifi-${version}/* ${STOWDIR}/${name}/opt/${pkgname}/
    sudo chmod +x "${STOWDIR}/${name}/opt/${pkgname}/tidal-hifi"
}

postinst() {
    sudo ln -s -r "/opt/${pkgname}/tidal-hifi" "/usr/bin/tidal-hifi"
}

removescript() {
    sudo rm -f "/usr/bin/tidal-hifi"
}
