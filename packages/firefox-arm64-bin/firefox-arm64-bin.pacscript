name="firefox-arm64-bin"
gives="firefox"
version="109.0.1-1"
repology=("project: ${gives}")
build_depends="libarchive-tools"
url="https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-zip-file.zip"
description="Free and open-source web browser developed by the Mozilla Foundation"
maintainer="Oren Klopfer <oren@taumoda.com>"

build() {
    sudo wget http://mirror.archlinuxarm.org/aarch64/extra/${gives}-${version}-aarch64.pkg.tar.xz
    sudo tar xvf *.tar.xz
}
install() {
    sudo install -Dm755 "usr/bin/firefox" -t "${pkgdir}/usr/bin/firefox"
    sudo cp -r "usr/lib/firefox" "${pkgdir}/usr/lib/"
    sudo install -Dm755 "usr/share/applications/firefox.desktop" -t "${pkgdir}/usr/share/applications/firefox-stable.desktop"
    sudo install -Dm644 "usr/share/icons/hicolor/" -t "${pkgdir}/usr/share/icons/"
    sudo install -Dm644 "usr/share/icons/hicolor/scalable/apps/firefox.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/firefox.svg"
    sudo install -Dm644 "usr/share/icons/hicolor/symbolic/apps/firefox-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/firefox-symbolic.svg"
}
