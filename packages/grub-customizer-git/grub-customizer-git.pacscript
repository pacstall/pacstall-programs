name="grub-customizer-git"
pkgname="grub-customizer"
url="https://git.launchpad.net/${pkgname}"
build_depends=("cmake" "g++" "libgtkmm-3.0-dev" "gettext" "libssl-dev" "libarchive-dev" "hwinfo")
breaks=("${pkgname}-deb")
description="Grub Customizer is a graphical interface to configure the GRUB2/BURG settings and menuentries"
maintainer="ObsidianPresidium <emil@aarestrup.nu>"
gives="${pkgname}"

pkgver() {
  mkdir tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && echo "$(git log --format=%ct.%h)" && sudo rm -r ../tempcount && cd ..
}
version="${pkgver}"

build() {
  cmake .
  make -j"$(nproc)"
}

install() {
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
