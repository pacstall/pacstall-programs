name="firefox-bin"
gives="firefox"
pkgver="125.0.2"
repology=("project: ${gives}")
url="https://download-installer.cdn.mozilla.net/pub/firefox/releases/${pkgver}/linux-x86_64/en-US/firefox-${pkgver}.tar.bz2"
homepage='https://www.mozilla.org/en-US/firefox'
pkgdesc="Free and open-source web browser developed by the Mozilla Foundation"
maintainer="Oren Klopfer <oren@taumoda.com>"
arch=('amd64')
hash="ecd3d99be21bc2c3afb6f1a89fc587adb3dcd2a4ef22f95350d461f86251ae7b"

package() {
  cd ..
  sudo mkdir -p "${pkgdir}/lib/firefox"
  sudo cp -r firefox/* "${pkgdir}/lib/firefox"
  sudo chmod +x "${pkgdir}/lib/firefox/firefox"
  sudo chmod +x "${pkgdir}/lib/firefox/firefox-bin"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
Name=Firefox Stable
Comment=Web Browser
Exec=/lib/firefox/firefox %u
Terminal=false
Type=Application
Icon=/lib/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=Private;

[Desktop Action Private]
Exec=/lib/firefox/firefox --private-window %u
Name=Open in private mode' | sudo tee "${pkgdir}/usr/share/applications/firefox.desktop" > /dev/null
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo ln -sf "/lib/firefox/firefox-bin" "${pkgdir}/usr/bin/firefox-bin"
  sudo ln -sf "/lib/firefox/firefox" "${pkgdir}/usr/bin/firefox"
}
