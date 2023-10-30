name="telegram-bin"
gives="telegram"
pkgver="4.11.1"
homepage="https://telegram.org/"
pkgdesc="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed"
url="https://updates.tdesktop.com/tlinux/tsetup.${pkgver}.tar.xz"
hash="892cec4592ed2365e7b785740cc8d0d08e15fa93062a0a6aec53b3ed59df1d4a"
repology=("project: telegram-desktop")
maintainer="Diegiwg <diegiwg@gmail.com>"

package() {
  sudo install -Dm755 "Telegram" "${pkgdir}/usr/bin/${gives}"
}
