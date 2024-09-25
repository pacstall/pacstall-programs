pkgname="zen-browser-specific-bin"
gives="zen-browser"
pkgver="1.0.1-a.5"
pkgdesc="Experience tranquillity while browsing the web without people tracking you!"
url="https://github.com/zen-browser/desktop"
license=("MPL-2.0")
repology=("project: zen-browser")
arch=("amd64")
source=("zen-browser-${pkgver}.tar.bz2::https://github.com/zen-browser/desktop/releases/download/${pkgver}/zen.linux-specific.tar.bz2")
sha256sums=('f4d5ddef8d9a91565cb95ad66c8df510015bf74696cfbc2d8a257d838d3dd3c8')

package() {
  cd "${srcdir}"

  # Lib
  mkdir -p "${pkgdir}/usr/lib/zen-browser"
  cp -r zen/* "${pkgdir}/usr/lib/zen-browser"
  chmod +x "${pkgdir}/usr/lib/zen-browser/zen"
  chmod +x "${pkgdir}/usr/lib/zen-browser/zen-bin"

  # Desktop
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
  Name=Zen Browser
  Comment=Experience tranquillity while browsing the web without people tracking you!
  Exec=/usr/lib/zen-browser/zen-bin %u
  X-MultipleArgs=false
  Terminal=false
  Type=Application
  Icon=zen-browser
  Categories=Network;WebBrowser;
  MimeType=application/json;application/pdf;application/rdf+xml;application/rss+xml;application/x-xpinstall;application/xhtml+xml;application/xml;audio/flac;audio/ogg;audio/webm;image/avif;image/gif;image/jpeg;image/png;image/svg+xml;image/webp;text/html;text/xml;video/ogg;video/webm;x-scheme-handler/chrome;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/mailto;
  StartupWMClass=zen-alpha
  StartupNotify=true
  Keywords=Internet;WWW;Browser;Web;Explorer;
  Actions=new-window;new-private-window;profilemanager;

  [Desktop Action new-window]
  Name=Open a New Window
  Exec=/usr/lib/zen-browser/zen-bin %u

  [Desktop Action new-private-window]
  Name=Open a New Private Window
  Exec=/usr/lib/zen-browser --private-window %u

  [Desktop Action profilemanager]
  Name=Open the Profile Manager
  Exec=/usr/lib/zen-browser --ProfileManager %u' | tee "${pkgdir}/usr/share/applications/zen-browser.desktop" > /dev/null

  # bin
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf "/usr/lib/zen-browser/zen-bin" "${pkgdir}/usr/bin/zen-bin"
  ln -sf "/usr/lib/zen-browser/zen" "${pkgdir}/usr/bin/zen"

  # Icons
  for i in 16x16 32x32 48x48 64x64 128x128; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${i}/apps/"
    ln -s "/usr/lib/zen-browser/browser/chrome/icons/default/default${i/x*/}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}/apps/zen-browser.png"
  done
}
