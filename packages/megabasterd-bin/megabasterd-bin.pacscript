name="megabasterd-bin"
gives="megabasterd"
_name="MegaBasterd"
pkgver="8.21"
pkgdesc="Yet another unofficial (and ugly) cross-platform MEGA downloader/uploader/streaming suite"
homepage="https://github.com/tonikelope/${gives}"
depends=("java11-runtime")
url="${homepage}/releases/download/v${pkgver}/${_name}_${pkgver}.jar"
hash="3f7460b5ba20cf84ea034e9f2c49def9b07cf59680a3b36492875d851f9e0241"
maintainer="vigress8 <vig@disroot.org>"
repology=("project: ${gives}")

package() {
  sudo install -Dm644 "${_name}_${pkgver}.jar" "${pkgdir}/usr/share/java/${gives}/${gives}.jar"

  cat <<-END > "${gives}"
  #!/usr/bin/env bash
  java -jar /usr/share/java/${gives}/${gives}.jar "$@"
END

  cat <<-END > "${gives}.desktop"
  [Desktop Entry]
  Type=Application
  Name=${_name}
  Comment=Yet another unofficial (and ugly) cross-platform MEGA downloader/uploader/streaming suite.
  Icon=${gives}
  TryExec=${gives}
  Exec=${gives}
  Terminal=false
  Categories=Application;Network;
  StartupWMClass=com-tonikelope-${gives}-MainPanel
END

  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  sudo install -Dm644 "${gives}.desktop" -t "${pkgdir}/usr/share/applications"

  wget -qO "${gives}.png" "https://raw.githubusercontent.com/tonikelope/${gives}/v${pkgver}/src/main/resources/images/pica_roja_big.png"
  sudo install -Dm644 "${gives}.png" -t "${pkgdir}/usr/share/pixmaps"
}
