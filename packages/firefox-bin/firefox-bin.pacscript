pkgname="firefox-bin"
gives="firefox"
pkgver="130.0.1"
repology=("project: ${gives}")
source=("https://download-installer.cdn.mozilla.net/pub/firefox/releases/${pkgver}/linux-x86_64/en-US/firefox-${pkgver}.tar.bz2")
url='https://www.mozilla.org/en-US/firefox'
pkgdesc="Free and open-source web browser developed by the Mozilla Foundation"
maintainer=("Oren Klopfer <oren@taumoda.com>")
arch=('amd64')
sha256sums=("3b9cd7fe7d22f0960ee5a058e3c9e6b507814958ec5a9ac691cbd5ebd0895c93")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/lib/firefox"
  cp -r firefox/* "${pkgdir}/lib/firefox"
  chmod +x "${pkgdir}/lib/firefox/firefox"
  chmod +x "${pkgdir}/lib/firefox/firefox-bin"
  mkdir -p "${pkgdir}/usr/share/applications/"
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
Name=Open in private mode' | tee "${pkgdir}/usr/share/applications/firefox.desktop" > /dev/null
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/lib/firefox/firefox-bin" "${pkgdir}/usr/bin/firefox-bin"
  ln -sf "/lib/firefox/firefox" "${pkgdir}/usr/bin/firefox"
}
