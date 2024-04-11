pkgname="megabasterd-bin"
gives="megabasterd"
pkgver="8.21"
pkgdesc="Yet another unofficial (and ugly) cross-platform MEGA downloader/uploader/streaming suite"
url="https://github.com/tonikelope/${gives}"
depends=("java11-runtime")
source=(
  "${homepage}/releases/download/v${pkgver}/MegaBasterd_${pkgver}.jar"
  "${gives}.png::https://raw.githubusercontent.com/tonikelope/${gives}/v${pkgver}/src/main/resources/images/pica_roja_big.png"
)
sha256sums=(
  "3f7460b5ba20cf84ea034e9f2c49def9b07cf59680a3b36492875d851f9e0241"
  "SKIP"
)
maintainer=("vigress8 <vig@disroot.org>")
repology=("project: ${gives}")

package() {
  cd "${_archive}"
  install -Dm644 "MegaBasterd_${pkgver}.jar" "${pkgdir}/usr/share/java/${gives}/${gives}.jar"

  cat <<-END > "${gives}"
  #!/usr/bin/env bash
  java -jar /usr/share/java/${gives}/${gives}.jar "$@"
END

  cat <<-END > "${gives}.desktop"
  [Desktop Entry]
  Type=Application
  Name=MegaBasterd
  Comment=Yet another unofficial (and ugly) cross-platform MEGA downloader/uploader/streaming suite.
  Icon=${gives}
  TryExec=${gives}
  Exec=${gives}
  Terminal=false
  Categories=Application;Network;
  StartupWMClass=com-tonikelope-${gives}-MainPanel
END

  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${gives}.desktop" -t "${pkgdir}/usr/share/applications"

  install -Dm644 "${srcdir}/${gives}.png" -t "${pkgdir}/usr/share/pixmaps"
}
