name="telegram-bin"
gives="telegram"
pkgver="4.8.7"
homepage="https://telegram.org/"
pkgdesc="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed"
url="https://updates.tdesktop.com/tlinux/tsetup.${pkgver}.tar.xz"
hash="c441140ebc1cf97a6e4a29482581a2e94e27bf0e20c4d64ad292b5300636e74b"
repology=("project: telegram-desktop")
maintainer="Diegiwg <diegiwg@gmail.com>"

package() {
  sudo install -Dm755 "Telegram" "${pkgdir}/usr/bin/${gives}"
}
