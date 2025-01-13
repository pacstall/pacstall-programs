pkgname="rider-bin"
pkgver="2024.3.3"
gives="rider"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="The world's most loved .NET and game dev IDE"
source_amd64=("https://download-cdn.jetbrains.com/${gives}/JetBrains.Rider-${pkgver}.tar.gz")
sha256sums_amd64=("3185826c0d85c06bf18c5ece3f5f9698acef006932b7a92b6cb190fd4d8e2807")
source_arm64=("https://download-cdn.jetbrains.com/${gives}/JetBrains.Rider-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("8ca14eeae6a9164da955f9e292dda788bda53a031c24ef6c2fab505e3e2f175b")
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
