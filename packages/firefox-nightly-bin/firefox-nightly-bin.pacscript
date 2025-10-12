pkgname="firefox-nightly-bin"
gives="firefox-nightly"
pkgver="144.0a1"
repology=("project: ${gives}")
replaces=("${gives}" "${gives}-deb")
source_amd64=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-${pkgver}.en-US.linux-x86_64.tar.xz")
source_arm64=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-${pkgver}.en-US.linux-aarch64.tar.xz")
url='https://www.mozilla.org/en-US/firefox'
pkgdesc="Free and open-source web browser developed by the Mozilla Foundation (Nightly)"
maintainer=("Oren Klopfer <oren@taumoda.com>")
arch=('amd64' 'arm64')
# builds update daily, so no sha256sums are provided

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/lib/firefox-nightly"
  cp -r firefox/* "${pkgdir}/lib/firefox-nightly"
  chmod +x "${pkgdir}/lib/firefox-nightly/firefox"
  chmod +x "${pkgdir}/lib/firefox-nightly/firefox-bin"
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
Name=Firefox Nightly
Comment=Web Browser
Exec=/lib/firefox-nightly/firefox %u
Terminal=false
Type=Application
Icon=/lib/firefox-nightly/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=Private;

[Desktop Action Private]
Exec=/lib/firefox-nightly/firefox --private-window %u
Name=Open in private mode' | tee "${pkgdir}/usr/share/applications/firefox-nightly.desktop" > /dev/null
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/lib/firefox-nightly/firefox-bin" "${pkgdir}/usr/bin/firefox-nightly-bin"
  ln -sf "/lib/firefox-nightly/firefox" "${pkgdir}/usr/bin/firefox-nightly"
}
