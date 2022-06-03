name="anydesk-bin"
gives="anydesk"
breaks="${gives}-deb"
replace="${gives}"
repology=("project: ${gives}")
version="6.1.1"
url="https://download.anydesk.com/linux/${gives}-${version}-amd64.tar.gz"
depends="libc6 libgcc1 libglib2.0-0 libgtk2.0-0 libstdc++6 libx11-6 libxcb-shm0 libxcb1 libpango1.0-0 libcairo2 libxrandr2 libx11-xcb1 libxtst6 libxfixes3 libxdamage1 libgtkglext1"
description="AnyDesk provides platform independent remote access to personal computers and other devices running the host application - Binary version"
hash="102e72c75502a4779083320322dd047e2b0c00a25ead7444a00aad1db54325aa"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    true
}

install() {
    cd anydesk-${version}
    # Binary
    sudo install -Dm644 "anydesk" "${STOWDIR}/${name}/usr/bin"
    # Polkit
    sudo install -Dm644 "./polkit-1/com.anydesk.anydesk.policy" "${STOWDIR}/${name}/usr/share/polkit-1/actions"
    # .desktop 
    sudo install -Dm644 "anydesk.desktop" "${STOWDIR}/${name}/usr/share/applications"
    # Systemd
    sudo install -Dm644 "./systemd/anydesk.service" "${STOWDIR}/${name}/usr/lib/systemd/system/"
    # Icon
    sudo install -Dm644 "./icons/hicolor/scalable/apps/anydesk.svg" "${STOWDIR}/${name}/usr/share/pixmaps/anydesk.svg"
}

# vim:set ft=sh ts=2 sw=2 et: