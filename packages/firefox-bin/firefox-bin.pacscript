name="firefox-bin"
gives="firefox"
version="110.0.1"
repology=("project: ${gives}")
url="https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/linux-x86_64/en-US/firefox-${version}.tar.bz2"
description="Free and open-source web browser developed by the Mozilla Foundation"
maintainer="Henryws <hwengerstickel@pm.me>"
arch=('amd64')
hash="0ffd6499f8e2bb31d5321a6ec1ed5c2fcfb22f917a49a2b0c2d8b6fd379a1e7f"

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
