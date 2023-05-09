name="firefox-bin"
gives="firefox"
version="113.0"
repology=("project: ${gives}")
url="https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/linux-x86_64/en-US/firefox-${version}.tar.bz2"
homepage='https://www.mozilla.org/en-US/firefox'
description="Free and open-source web browser developed by the Mozilla Foundation"
maintainer="Henryws <hwengerstickel@pm.me>"
arch=('amd64')
hash="570d80410aa9333a3749bd538041a0456bf78e83ad27b485aa89f19c07d03890"

install() {
  cd ..
  sudo mkdir -p "${pkgdir}/opt/firefox"
  sudo cp -r firefox/* "${pkgdir}/opt/firefox"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
Name=Firefox Stable
Comment=Web Browser
Exec=/opt/firefox/firefox %u
Terminal=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=Private;

[Desktop Action Private]
Exec=/opt/firefox/firefox --private-window %u
Name=Open in private mode' | sudo tee "${pkgdir}/usr/share/applications/firefox-stable.desktop" > /dev/null
}
