pkgname="arduino-ide-bin"
gives="arduino-ide"
arch=("amd64")
pkgver="2.3.2"
repology=("project: arduino")
maintainer=("DismissedGuy <me@mikealmel.ooo>")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
source=(
  "@${pkgname}~${pkgver}::https://downloads.arduino.cc/${gives}/${gives}_${pkgver}_Linux_64bit.zip"
  "arduino.svg::https://www.arduino.cc/wiki/370832ed4114dd35d498f2f449b4781e/arduino.svg"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
)
pkgdesc="An open-source IDE that makes it easy to write code and upload it to Arduino boards"
sha256sums=(
  "1a23b911043a247116ace846f03a0265c719dcd49cf9a8af09334db4d3916e88"
  "SKIP"
  "SKIP"
)

prepare() {
  cd "${pkgname}~${pkgver}"
  # potential leftover symlink from v1
  rm -f "/usr/local/bin/arduino"

  mkdir -p "${pkgdir}/usr/share/${gives}/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
}

package() {
  cd "${pkgname}~${pkgver}"
  # install files
  cp -R ./* "${pkgdir}/usr/share/${gives}/"

  # fetch .desktop file + icon
  install -Dm644 "${srcdir}/arduino.svg" "${pkgdir}/usr/share/pixmaps/arduino-ide-v2.svg"
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/local/bin"
  ln -sf "/usr/share/${gives}/arduino-ide" "${pkgdir}/usr/local/bin/arduino-ide"
}

post_install() {
  # link main executable so it is in PATH

  fancy_message info "Please run the following command to authorize access to the Arduino's serial interface: \"sudo usermod -aG uucp,dialout \${USER:-\$(whoami)}\". You might have to log out and in again for the changes to take effect."
}
