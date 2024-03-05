#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="spacecadetpinball-git"
pkgname="spacecadetpinball"
pkgdesc='Reverse engineered port of "3D Pinball for Windows – Space Cadet" to Linux'
source=(
  "https://github.com/k4zmu2a/${pkgname}.git"
  "https://archive.org/download/SpaceCadet_Plus95/Space_Cadet.rar"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
)
hash=(
  "SKIP"
  "3cc5dfd914c2ac41b03f006c7ccbb59d6f9e4c32ecfd1906e718c8e47f130f4a"
  "6edc9d9e73f430b025d0efe09ecd9027d38f7c2e3562de470a8057939fb1889f"
)
pkgver="2.0.1"
depends=("timidity" "freepats" "libsdl2-2.0-0" "libsdl2-mixer-2.0-0")
makedepends=("libsdl2-dev" "libsdl2-mixer-dev" "unrar" "cmake")
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-app" "${pkgname}-deb")

build() {
  cmake -B "build" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make -j"${NCPU}" -C "build"
}

package() {
  # Install LICENSE
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install binary
  sudo install -Dm755 "bin/SpaceCadetPinball" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"

  # Install wrapper script
  sudo install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << END
#!/bin/sh
# Run program in correct directory so it can find it's resources
cd /usr/lib/${pkgname}
exec ./${pkgname} "\$@"
END

  # Install resources
  sudo install -m644 ./*.DAT ./*.DOC ./*.MID ./*.BMP ./*.INF -t "${pkgdir}/usr/lib/${pkgname}"
  sudo install -m644 ./Sounds/* -t "${pkgdir}/usr/lib/${pkgname}/Sounds"

  # Install icon
  sudo install -Dm644 "SpaceCadetPinball/Icon_1.ico" "${pkgdir}/usr/lib/${pkgname}/icon.ico"

  # Install desktop launcher
  sudo install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
