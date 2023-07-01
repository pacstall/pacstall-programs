name="firefox-bin"
gives="firefox"
version="114.0.1"
repology=("project: ${gives}")
url="https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/linux-x86_64/en-US/firefox-${version}.tar.bz2"
homepage='https://www.mozilla.org/en-US/firefox'
description="Free and open-source web browser developed by the Mozilla Foundation"
maintainer="Elsie19 <hwengerstickel@pm.me>"
arch=('amd64')
hash="a2e6b307fa944a9ca9153c3dbe6d4a3c30e6f86d65dea3273f3873bb765246e0"

install() {
  cd ..
  sudo mkdir -p "${pkgdir}/etc/firefox"
  sudo cp -r firefox/* "${pkgdir}/etc/firefox"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
Name=Firefox Stable
Comment=Web Browser
Exec=/etc/firefox/firefox %u
Terminal=false
Type=Application
Icon=/etc/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=Private;

[Desktop Action Private]
Exec=/etc/firefox/firefox --private-window %u
Name=Open in private mode' | sudo tee "${pkgdir}/usr/share/applications/firefox.desktop" > /dev/null
}
