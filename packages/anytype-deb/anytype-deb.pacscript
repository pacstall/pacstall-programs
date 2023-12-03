name="anytype-deb"
gives="anytype"
pkgver="0.35.4"
pkgdesc="Official Anytype client for Linux"
hash="8948f1219939eaa9edef2922e44a7d0b142787e77a383d71d371e89ab219a8e3"
maintainer="Anifyuli <anifyuliansyah@gmail.com>"
arch=('amd64')
url="https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}/anytype_${pkgver}_amd64.deb"
homepage='https://anytype.io/'
repology=("project: ${gives}")

pre_install() {
    sudo dpkg-divert --rename --remove /usr/share/icons/hicolor/0x0/apps/anytype.png
}

post_install() {
    sudo dpkg-divert --divert "/usr/share/icons/hicolor/0x0/apps/anytype.png" --rename  "/usr/share/icons/hicolor/512x512/apps/anytype.png"
}
