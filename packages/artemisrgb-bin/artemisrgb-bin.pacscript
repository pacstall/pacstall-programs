pkgname=artemisrgb-bin
pkgver=1.2025.0819.0
gives="artemisrgb"
url="https://artemis-rgb.com/"
pkgdesc="A universal RGB control software"
arch=("x86_64")
provides=("artemisrgb")
conflicts=("artemisrgb" "artemisrgb-git")
license=("custom:PolyForm Noncommercial License 1.0.0")
depends=("dotnet-runtime-7.0" "hicolor-icon-theme" "libc6" "bash" "zlib1g" "fontconfig" "libstdc++6")
makedepends=("unzip")
options=("staticlibs")
source=("${pkgname}-${pkgver}.zip::https://updating.artemis-rgb.com/api/artifacts/3795832408")
sha256sums=('424b0abdc63a60709cbc217393c80d1112aa6f97a4b0e6a797c2fd7d59e6a790')
noextract=("${pkgname}-${pkgver}.zip")

package() {
  unzip -o "${srcdir}/${pkgname}-${pkgver}.zip" -d "${srcdir}/${pkgname}-${pkgver}/"

  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/share/"
  cp -r --preserve=mode,timestamps "${srcdir}/${pkgname}-${pkgver}/" "${pkgdir}/opt/${gives}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${gives}/Artemis.UI.Linux" "${pkgdir}/usr/bin/${gives}"

  # .desktop
  cat > "${srcdir}/artemis.desktop" << EOF
[Desktop Entry]
Name=Artemis
Type=Application
Exec=/usr/bin/artemisrgb
Icon=artemis
Categories=Utility
EOF
  install -Dm644 "${srcdir}/artemis.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"

  # Icon for .desktop
  cd "${srcdir}/${pkgname}-${pkgver}/Icons/"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/hicolor/{}" \;

}
