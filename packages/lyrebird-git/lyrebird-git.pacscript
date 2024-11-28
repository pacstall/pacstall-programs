pkgname="lyrebird-git"
gives="lyrebird"
pkgdesc="Simple and powerful voice changer for Linux, written in GTK 3"
source=("https://github.com/lyrebird-voice-changer/lyrebird.git")
arch=("any")
pkgver="1.1.0"
maintainer=("D-Brox <BroxZuka@protonmail.com>")
depends=("python3" "libgtk-3-dev" "python3-gi" "python3-gi-cairo" "gir1.2-gtk-3.0" "sox" "libsox-fmt-pulse" "pulseaudio")
makedepends=("python3-pip")

package() {
  cd "lyrebird"
  INSTALL_PREFIX="${pkgdir}/usr/local" ./install.sh
  sed -i "s|${pkgdir%/}||g" "${pkgdir}/usr/local/share/applications/lyrebird.desktop"
}
