pkgname="zen-browser-generic-bin"
gives="zen-browser"
pkgver="1.0.1-a.5"
pkgdesc="Experience tranquillity while browsing the web without people tracking you!"
url="https://github.com/zen-browser/desktop"
license=("MPL-2.0")
repology=("project: zen-browser")
arch=("amd64")
source=("zen-browser-${pkgver}.tar.bz2::https://github.com/zen-browser/desktop/releases/download/${pkgver}/zen.linux-generic.tar.bz2")
sha256sums=('8b490ff5b55685abcac698d3267a7cdbb327db125086df13fa9482f0c67ed532')
depends=("libasound2t64" "libatk1.0-0t64" "libc6" "libcairo-gobject2" "libcairo2" "libdbus-1-3" "libfontconfig1" "libfreetype6" "libgcc-s1" "libgdk-pixbuf-2.0-0" "libglib2.0-0t64" "libgtk-3-0t64" "libpango-1.0-0" "libpangocairo-1.0-0" "libstdc++6" "libx11-6" "libx11-xcb1" "libxcb-shm0" "libxcb1" "libxcomposite1" "libxcursor1" "libxdamage1" "libxext6" "libxfixes3" "libxi6" "libxrandr2" "libxrender1")

package() {
  cd "${srcdir}"

  # Create directories
  mkdir -p "${pkgdir}/usr/lib/zen-browser"
  cp -r zen/* "${pkgdir}/usr/lib/zen-browser"
  chmod +x "${pkgdir}/usr/lib/zen-browser/zen"
  chmod +x "${pkgdir}/usr/lib/zen-browser/zen-bin"

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
