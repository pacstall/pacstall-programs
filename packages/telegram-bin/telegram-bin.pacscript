name="telegram-bin"
gives="telegram"
pkgver="4.9.2"
homepage="https://telegram.org/"
pkgdesc="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed"
url="https://updates.tdesktop.com/tlinux/tsetup.${pkgver}.tar.xz"
hash="add75e937a50d2fe1ee2002ff44d68b54228b30cd833f1ff9c20de93c7e4634f"
repology=("project: telegram-desktop")
maintainer="Diegiwg <diegiwg@gmail.com>"

package() {
  sudo install -Dm755 "Telegram" "${pkgdir}/usr/bin/${gives}"
}
