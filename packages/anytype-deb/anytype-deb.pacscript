name="anytype-deb"
gives="anytype"
pkgver="0.36.0"
pkgdesc="Official Anytype client for Linux"
hash="238a0eacea55f471b39ae1dff9beb895fc2656bf9ff371d056b2da3307279a9d"
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

post_remove() {
    sudo dpkg-divert --remove --no-rename "/usr/share/icons/hicolor/512x512/apps/anytype.png" 
}
