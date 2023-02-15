name="firefox-arm64-bin"
gives="firefox"
version="110.0-1"
repology=("project: ${gives}")
url="http://mirror.archlinuxarm.org/aarch64/extra/${gives}-${version}-aarch64.pkg.tar.xz"
description="Free and open-source web browser developed by the Mozilla Foundation"
maintainer="Oren Klopfer <oren@taumoda.com>"
hash="b197fe80bfe0c6025daf1364212ee1917c3781124b45545f41c7475f11c892d1"

install() {
    cd ..
    sudo install -Dm755 "usr/bin/firefox" -t "${pkgdir}/usr/bin/"
    sudo cp -r "usr/lib/firefox/" "${pkgdir}/usr/lib/firefox"
    sudo install -Dm755 "usr/share/applications/firefox.desktop" -t "${pkgdir}/usr/share/applications/" && sudo mv "${pkgdir}/usr/share/applications/firefox.desktop" "${pkgdir}/usr/share/applications/firefox-stable.desktop"
    sudo install -Dm644 "usr/share/icons/hicolor/scalable/apps/firefox.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    sudo install -Dm644 "usr/share/icons/hicolor/symbolic/apps/firefox-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/"
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 192x192 256x256 384x384; do
        sudo install -Dm644 "usr/share/icons/hicolor/$i/apps/firefox.png" -t "${pkgdir}/usr/share/icons/hicolor/$i/apps/"
    done
}
