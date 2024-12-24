pkgname="hello-rhino-git"
gives="hello-rhino"
source=("https://github.com/rhino-linux/hello-rhino.git")
arch=("any")
pkgver="2024.3"
depends=("libssl-dev")
makedepends=("rustc" "cargo" "meson" "ninja" "gettext")
pkgdesc="Greeter application for Rhino Linux"
maintainer=("AJStrong <ajstrongdev@proton.me>")
external_connection=true

prepare() {
  cd "${gives}"
  meson build --buildtype=release --prefix=/usr
}

build() {
  cd "${gives}"
  ninja -C build -j"${NCPU}"
}

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" ninja -C build install
}

post_install() {
  mkdir -p "${homedir}/.config/autostart"
  if ! [[ -f "${homedir}/.config/autostart/hello-rhino.desktop" ]]; then
    sudo ln -sf "/usr/local/share/applications/hello-rhino.desktop" "${homedir}/.config/autostart/hello-rhino.desktop"
  fi
}

post_remove() {
  if [[ -L "${homedir}/.config/autostart/hello-rhino.desktop" ]]; then
    sudo rm -f "${homedir}/.config/autostart/hello-rhino.desktop"
  fi
}
