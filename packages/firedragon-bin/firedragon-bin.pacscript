pkgname="firedragon-bin"
gives="firedragon"
arch=('amd64')
pkgver="11.22.0-2"
repology=("project: ${gives}")
pkgdesc="FireDragon is a browser based on the excellent Floorp browser"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://gitlab.com/garuda-linux/${gives}/builder/-/releases/v${pkgver}/downloads/${gives}-v${pkgver}.linux-x86_64.tar.zst")
sha256sums=("bc5200c9fefd86c8d619cc18e9c54e5a6ba764af13d572d7c3f38e98c59c16e0")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/lib/firedragon"
  tar --strip-components=1 -xvf "${srcdir}/${gives}-v${pkgver}.linux-x86_64.tar.zst" -C "${pkgdir}/lib/firedragon"
  chmod +x "${pkgdir}/lib/firedragon/firedragon"
  chmod +x "${pkgdir}/lib/firedragon/firedragon-bin"
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
Name=Firedragon
Comment=Web Browser
Exec=/lib/firedragon/firedragon %u
Terminal=false
Type=Application
Icon=/lib/firedragon/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=Private;

[Desktop Action Private]
Exec=/lib/firedragon/firedragon --private-window %u
Name=Open in private mode' | tee "${pkgdir}/usr/share/applications/firedragon.desktop" > /dev/null
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/lib/firedragon/firedragon-bin" "${pkgdir}/usr/bin/firedragon-bin"
  ln -sf "/lib/firedragon/firedragon" "${pkgdir}/usr/bin/firedragon"
}
