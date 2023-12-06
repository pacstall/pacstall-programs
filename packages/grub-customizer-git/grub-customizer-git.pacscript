name="grub-customizer-git"
gives="grub-customizer"
url="https://git.launchpad.net/${gives}"
pkgver="5.0.6"
makedepends=("cmake" "g++" "libgtkmm-3.0-dev" "gettext" "libssl-dev" "libarchive-dev" "hwinfo")
breaks=("${gives}-deb")
pkgdesc="Grub Customizer is a graphical interface to configure the GRUB2/BURG settings and menuentries"
maintainer="ObsidianPresidium <emil@aarestrup.nu>"
pkgver() {
  git ls-remote "${url}" refs/heads/master | cut -f1 | cut -c1-8
}

build() {
  cmake .
  make -j"${NCPU}"
}

package() {
  sudo install -Dm755 "./grub-customizer" "${pkgdir}/usr/bin/grub-customizer"
  sudo install -Dm755 "./misc/grub-customizer.desktop" "${pkgdir}/usr/share/applications/grub-customizer.desktop"
  sudo install -Dm644 "./misc/manpage.gz" "${pkgdir}/usr/share/man/man1/grub-customizer.1.gz"
  sudo install -Dm644 "./misc/icons/16x16.svg" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/grub-customizer.svg"
  sudo install -Dm644 "./misc/icons/24x24.svg" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/grub-customizer.svg"
  sudo install -Dm644 "./misc/icons/32x32.svg" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/grub-customizer.svg"
  sudo install -Dm644 "./misc/icons/48x48.svg" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/grub-customizer.svg"
  sudo install -Dm644 "./misc/icons/64x64.svg" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/grub-customizer.svg"
  sudo install -Dm644 "./misc/icons/128x128.svg" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/grub-customizer.svg"
}
