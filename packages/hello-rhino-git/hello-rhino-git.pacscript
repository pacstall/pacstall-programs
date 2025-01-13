pkgname="hello-rhino-git"
gives="hello-rhino"
source=("https://github.com/rhino-linux/hello-rhino.git")
arch=("any")
pkgver="2025.1-1"
depends=("libssl-dev")
makedepends=("cargo>=1.80.0" "meson" "ninja-build" "gettext")
pkgdesc="Greeter application for Rhino Linux"
maintainer=("AJStrong <ajstrongdev@proton.me>")
external_connection=true

prepare() {
  cd "${gives}"
  meson setup build/ --buildtype=release --prefix=/usr/local
}

build() {
  cd "${gives}"
  ninja -C build/ -j"${NCPU}"
}

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" ninja -C build/ install
}

post_install() {
  mkdir -p "${homedir}/.config/autostart"
  if ! [[ -f "${homedir}/.config/autostart/hello-rhino.desktop" ]]; then
    sudo cp "/usr/local/share/applications/hello-rhino.desktop" "${homedir}/.config/autostart/hello-rhino.desktop"
    sudo chown "${PACSTALL_USER}" "${homedir}/.config/autostart/hello-rhino.desktop"
  fi
}

post_remove() {
  if [[ -f "${homedir}/.config/autostart/hello-rhino.desktop" ]]; then
    sudo rm -f "${homedir}/.config/autostart/hello-rhino.desktop"
  fi
}
