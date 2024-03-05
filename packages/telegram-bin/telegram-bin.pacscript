name="telegram-bin"
gives="telegram"
pkgver="4.14.9"
homepage="https://telegram.org/"
pkgdesc="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed"
source=("https://updates.tdesktop.com/tlinux/tsetup.${pkgver}.tar.xz")
hash=("f75239beeab815c9b1dada08e0ff84885fc85bc4919178545fffe7018ddffcc2")
repology=("project: telegram-desktop")
maintainer="Diegiwg <diegiwg@gmail.com>"

package() {
  sudo install -Dm755 "Telegram" "${pkgdir}/usr/bin/${gives}"
}
