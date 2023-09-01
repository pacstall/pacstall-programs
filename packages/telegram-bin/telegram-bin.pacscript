name="telegram-bin"
gives="telegram"
pkgver="4.9.4"
homepage="https://telegram.org/"
pkgdesc="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed"
url="https://updates.tdesktop.com/tlinux/tsetup.${pkgver}.tar.xz"
hash="0969c422bc09b4139db672146a36d5a5ab212f3b53cf02c8e9c0f0387a28d97e"
repology=("project: telegram-desktop")
maintainer="Diegiwg <diegiwg@gmail.com>"

package() {
  sudo install -Dm755 "Telegram" "${pkgdir}/usr/bin/${gives}"
}
