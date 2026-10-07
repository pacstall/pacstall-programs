pkgname="firefox-bin"
gives="firefox"
pkgver="157.0.1"
repology=("project: ${gives}")
replaces=("${gives}-deb" "${gives}-arm64-deb")
source_amd64=("firefox-amd64-${pkgver}.tar.xz@https://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-x86_64/en-US/firefox-${pkgver}.tar.xz")
source_arm64=("firefox-arm64-${pkgver}.tar.xz@https://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-aarch64/en-US/firefox-${pkgver}.tar.xz")
url='https://www.mozilla.org/en-US/firefox'
optdepends=("speech-dispatcher: Common interface to speech synthesizers")
pkgdesc="Free and open-source web browser developed by the Mozilla Foundation"
maintainer=("Oren Klopfer <oren@taumoda.com>")
arch=('amd64' 'arm64')
sha256sums_amd64=("0d92bf39cdd174f5f361008509310bdefbce72a57ca10523a43b32d62dc699b6")
sha256sums_arm64=("b99d44d1d64bf8133db1c28e77cafdf82216af90c0a94802f0f6578c9b722d7d")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/lib/firefox"
  cp -r firefox/* "${pkgdir}/lib/firefox"
  for i in 16 32 48 64 128; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
    ln -s "/lib/firefox/browser/chrome/icons/default/default${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  chmod +x "${pkgdir}/lib/firefox/firefox"
  chmod +x "${pkgdir}/lib/firefox/firefox-bin"
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
Name=Firefox Stable
Comment=Web Browser
Exec=/lib/firefox/firefox %u
Terminal=false
Type=Application
Icon=firefox
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=Private;

[Desktop Action Private]
Exec=/lib/firefox/firefox --private-window %u
Name=Open in private mode' | tee "${pkgdir}/usr/share/applications/firefox.desktop" > /dev/null
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/lib/firefox/firefox-bin" "${pkgdir}/usr/bin/firefox-bin"
  ln -sf "/lib/firefox/firefox" "${pkgdir}/usr/bin/firefox"
}
