pkgname="hello-rhino-git"
gives="hello-rhino"
source=("https://github.com/sundaram123krishnan/hello-rhino.git")
arch=("any")
pkgver="2024.3"
depends=("libssl-dev")
makedepends=("rustc" "cargo")
pkgdesc="Greeter application for Rhino Linux"
maintainer=("AJStrong <ajstrongdev@proton.me>")
external_connection=true

build() {
  cd "${gives}"
  cargo build -j"${NCPU}" --locked --release
}

package() {
  cd "${gives}"
  install -Dm755 "target/release/${gives}" -t "${pkgdir}/usr/bin"
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
