name="lyrebird-git"
gives="lyrebird"
pkgdesc="Simple and powerful voice changer for Linux, written in GTK 3"
url="https://github.com/lyrebird-voice-changer/lyrebird.git"
pkgver="1.1.0"
maintainer="D-Brox <BroxZuka@protonmail.com>"
depends=("python3" "libgtk-3-dev" "python3-gi" "python3-gi-cairo" "gir1.2-gtk-3.0" "sox" "libsox-fmt-pulse" "pulseaudio")
makedepends=("python3-pip")
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

package() {
  sudo INSTALL_PREFIX="${pkgdir}/usr/local" ./install.sh
  sudo sed -i "s|${pkgdir%/}||g" "${pkgdir}/usr/local/share/applications/lyrebird.desktop"
}
