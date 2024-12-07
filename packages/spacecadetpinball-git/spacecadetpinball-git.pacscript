#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="spacecadetpinball-git"
gives="spacecadetpinball"
pkgdesc='Reverse engineered port of "3D Pinball for Windows – Space Cadet" to Linux'
source=(
  "https://github.com/k4zmu2a/${gives}.git"
  "Space_Cadet.rar::https://archive.org/download/SpaceCadet_Plus95/Space_Cadet.rar"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
)
noextract=("Space_Cadet.rar")
sha256sums=(
  "SKIP"
  "3cc5dfd914c2ac41b03f006c7ccbb59d6f9e4c32ecfd1906e718c8e47f130f4a"
  "6edc9d9e73f430b025d0efe09ecd9027d38f7c2e3562de470a8057939fb1889f"
)
arch=("any")
pkgver="2.0.1"
depends=("timidity" "freepats" "libsdl2-2.0-0" "libsdl2-mixer-2.0-0")
makedepends=("libsdl2-dev" "libsdl2-mixer-dev" "unrar" "cmake")
breaks=("${gives}" "${gives}-bin" "${gives}-app" "${gives}-deb")

prepare() {
  cd "spacecadetpinball"
  unrar e -y "${srcdir}"/Space_Cadet.rar Space_Cadet/
}

build() {
  cd "spacecadetpinball"
  cmake -B "build" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make -j"${NCPU}" -C "build"
}

package() {
  cd "spacecadetpinball"
  # Install LICENSE
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${gives}"

  # Install binary
  install -Dm755 "bin/SpaceCadetPinball" "${pkgdir}/usr/lib/${gives}/${gives}"

  # Install wrapper script
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${gives}" << END
#!/bin/sh
# Run program in correct directory so it can find it's resources
cd /usr/lib/${gives}
exec ./${gives} "\$@"
END

  # Install resources
  (
    cd Space_Cadet || return 1
    install -m644 ./*.DAT ./*.DOC ./*.MID ./*.BMP ./*.INF ./*.WAV -t "${pkgdir}/usr/lib/${gives}"
  )

  # Install icon
  install -Dm644 "SpaceCadetPinball/Icon_1.ico" "${pkgdir}/usr/lib/${gives}/icon.ico"

  # Install desktop launcher
  install -Dm644 "${srcdir}/${gives}.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim:set ft=sh ts=2 sw=2 et:
