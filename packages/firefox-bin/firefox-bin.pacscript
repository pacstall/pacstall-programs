name="firefox-bin"
gives="firefox"
pkgver="123.0"
repology=("project: ${gives}")
source=("https://download-installer.cdn.mozilla.net/pub/firefox/releases/${pkgver}/linux-x86_64/en-US/firefox-${pkgver}.tar.bz2")
homepage='https://www.mozilla.org/en-US/firefox'
pkgdesc="Free and open-source web browser developed by the Mozilla Foundation"
maintainer="Oren Klopfer <oren@taumoda.com>"
arch=('amd64')
hash=("99f86e24eacbaa429e5438bfc0b21e411ff1f8be95fda9800cbfb9c4ed0dc095")

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

post_install() {
  sudo ln -sf "/lib/firefox/firefox" "/usr/bin/firefox"
  sudo ln -sf "/lib/firefox/firefox-bin" "/usr/bin/firefox-bin"
}

post_remove() {
  sudo rm -f "/usr/bin/firefox" "/usr/bin/firefox-bin"
}
