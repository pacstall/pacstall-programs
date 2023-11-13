name="telegram-bin"
gives="telegram"
pkgver="4.11.6"
homepage="https://telegram.org/"
pkgdesc="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed"
url="https://updates.tdesktop.com/tlinux/tsetup.${pkgver}.tar.xz"
hash="bedd254361b1ad93c40deb565ecf58be828ef5ebb3314992f33b97dea6a4db4b"
repology=("project: telegram-desktop")
maintainer="Diegiwg <diegiwg@gmail.com>"

package() {
  sudo install -Dm755 "Telegram" "${pkgdir}/usr/bin/${gives}"
}
