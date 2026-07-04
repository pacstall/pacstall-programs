pkgname="megabasterd-bin"
gives="megabasterd"
arch=("amd64")
pkgver="8.57"
pkgdesc="Yet another unofficial (and ugly) cross-platform MEGA downloader/uploader/streaming suite"
url="https://github.com/tonikelope/${gives}"
depends=("java11-runtime")
source=(
  "${url}/releases/download/v${pkgver}/MegaBasterd_${pkgver}.jar"
  "${gives}.png::https://raw.githubusercontent.com/tonikelope/${gives}/v${pkgver}/src/main/resources/images/pica_roja_big.png"
)
sha256sums=(
  "583c9824617a30baca8320135c8115cdfac66ac92c7fcf4bde0d14546ba0292e"
  "SKIP"
)
repology=("project: ${gives}")

package() {
  cd "${srcdir}"
  install -Dm644 "MegaBasterd_${pkgver}.jar" "${pkgdir}/usr/share/java/${gives}/${gives}.jar"

  cat <<- END > "${gives}"
  #!/usr/bin/env bash
  java -jar /usr/share/java/${gives}/${gives}.jar "$@"
END

  cat <<- END > "${gives}.desktop"
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
