name="telegram-bin"
gives="telegram"
version="4.8.4"
homepage="https://telegram.org/"
description="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed"
url="https://updates.tdesktop.com/tlinux/tsetup.${version}.tar.xz"
hash="14c4e6cc012430a65330d532cdf945a5c1bf38ea098368acabe9578c69625008"
repology=("project: telegram-desktop")
maintainer="Diegiwg <diegiwg@gmail.com>"

package() {
  sudo install -Dm755 "Telegram" "${pkgdir}/usr/bin/${gives}"
}
