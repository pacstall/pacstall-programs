pkgname="telegram-bin"
gives="telegram"
pkgver="4.14.9"
url="https://telegram.org/"
pkgdesc="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed"
source=("https://updates.tdesktop.com/tlinux/tsetup.${pkgver}.tar.xz")
sha256sums=("f75239beeab815c9b1dada08e0ff84885fc85bc4919178545fffe7018ddffcc2")
repology=("project: telegram-desktop")
maintainer=("Diegiwg <diegiwg@gmail.com>")

package() {
  cd "${_archive}"
  install -Dm755 "Telegram" "${pkgdir}/usr/bin/${gives}"
}
