name="anytype-deb"
gives="anytype"
pkgver="0.36.0"
pkgdesc="Operating environment for the new internet. Anytype is a next generation software that breaks down barriers between applications, gives back privacy and data ownership to users."
hash="238a0eacea55f471b39ae1dff9beb895fc2656bf9ff371d056b2da3307279a9d"
maintainer="Anifyuli <anifyuliansyah@gmail.com>"
arch=('amd64')
url="https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}/anytype_${pkgver}_amd64.deb"
homepage='https://anytype.io/'
repology=("project: ${gives}")

# This post_install() function to repair icon not appear issue nowadays
post_install() {
  sudo cp /usr/share/icons/hicolor/0x0/apps/anytype.png /usr/share/icons/hicolor/512x512/apps
}

# This post_remove() function to reverse post_install() function
post_remove() {
  sudo rm -rf /usr/share/icons/hicolor/512x512/apps/anytype.png
}
