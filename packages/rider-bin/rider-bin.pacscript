pkgname="rider-bin"
pkgver="2025.3.3"
gives="rider"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="The world's most loved .NET and game dev IDE"
source_amd64=("https://download-cdn.jetbrains.com/${gives}/JetBrains.Rider-${pkgver}.tar.gz")
sha256sums_amd64=("b0117f5c0e76a12143d5d126ce1be8edcc1fe441938b49b1d71dcf7286d0540b")
source_arm64=("https://download-cdn.jetbrains.com/${gives}/JetBrains.Rider-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("40a073bac6514ceabed8fb5ef9212080dfe87692681ca688c011a92def63aa65")
repology=("project: rider")

package() {
  cd "${srcdir}/JetBrains Rider-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/licenses/rider"
  mkdir -p "${pkgdir}/usr/share/rider"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp -dr --no-preserve='ownership' bin jbr lib modules plugins tools product-info.json "${pkgdir}/usr/share/rider/"
  cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/rider/"
  cp -dr "${pkgdir}/usr/share/rider/bin/rider.png" "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/share/rider/bin/rider.sh" "${pkgdir}/usr/bin/rider"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cat << EOF > "${pkgdir}/usr/share/applications/rider.desktop"
[Desktop Entry]
Type=Application
Name=Rider
Icon=rider
Exec=/usr/share/rider/bin/rider
Comment=The world's most loved .NET and game dev IDE.
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-webstorm
EOF
}
