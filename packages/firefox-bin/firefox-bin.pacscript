name="firefox-bin"
gives="firefox"
version="115.0.2"
repology=("project: ${gives}")
url="https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/linux-x86_64/en-US/firefox-${version}.tar.bz2"
homepage='https://www.mozilla.org/en-US/firefox'
description="Free and open-source web browser developed by the Mozilla Foundation"
maintainer="Elsie19 <hwengerstickel@pm.me>"
arch=('amd64')
hash="9e4fdf4f798df6a85c3f8e8b996f7998467ccc0f1a5d67ef8aadd27b6944ca0b"

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
}

postinst() {
  sudo ln -sf "/lib/firefox/firefox" "/usr/bin/firefox"
  sudo ln -sf "/lib/firefox/firefox-bin" "/usr/bin/firefox-bin"
}

removescript() {
  sudo rm -f "/usr/bin/firefox" "/usr/bin/firefox-bin"
}
