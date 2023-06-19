name="lyrebird-git"
gives="lyrebird"
description="Simple and powerful voice changer for Linux, written in GTK 3"
url="https://github.com/lyrebird-voice-changer/lyrebird.git"
maintainer="D-Brox <BroxZuka@protonmail.com>"
depends=("python3" "libgtk-3-dev" "python3-gi" "python3-gi-cairo" "gir1.2-gtk-3.0" "sox" "libsox-fmt-pulse" "pulseaudio")
build_depends=("python3-pip")
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  sudo pip3 -q install toml
}

package() {
  sudo mkdir -p "${pkgdir}/usr/share/lyrebird/"
  sudo cp -rf "app/" "${pkgdir}/usr/share/lyrebird/"
  sudo install -Dm644 "icon.png" -t "${pkgdir}/usr/share/lyrebird/"
  sudo install -Dm644 "app.py" -t "${pkgdir}/usr/share/lyrebird/"
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/lyrebird/"
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/lyrebird/"
  sudo install -Dm755 "lyrebird" -t "${pkgdir}/usr/bin/"
}
