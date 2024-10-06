pkgname="zen-browser-generic-bin"
gives="zen-browser"
pkgver="1.0.1-a.7"
pkgrel=1
pkgdesc="Experience tranquillity while browsing the web without people tracking you!"
url="https://zen-browser.app/"
license=("MPL-2.0")
repology=("project: zen-browser")
arch=("amd64")
maintainer=("D-Brox <davidfbg00@gmail.com>")
source=("zen-browser-${pkgver}.tar.bz2::https://github.com/zen-browser/desktop/releases/download/${pkgver}/zen.linux-generic.tar.bz2")
sha256sums=('f0b86668a4715ef93a8c1bcf0831aa0f791221b0f235db071feba413cfce57fb')
depends=("libasound2" "libatk1.0-0" "libc6" "libcairo-gobject2" "libcairo2" "libdbus-1-3" "libfontconfig1" "libfreetype6" "libgcc-s1" "libgdk-pixbuf-2.0-0" "libglib2.0-0" "libgtk-3-0" "libpango-1.0-0" "libpangocairo-1.0-0" "libstdc++6" "libx11-6" "libx11-xcb1" "libxcb-shm0" "libxcb1" "libxcomposite1" "libxcursor1" "libxdamage1" "libxext6" "libxfixes3" "libxi6" "libxrandr2" "libxrender1")

package() {
  cd "${srcdir}"

  # Zen
  mkdir -p "${pkgdir}/usr/lib/zen-browser"
  cp -r zen/* "${pkgdir}/usr/lib/zen-browser"
  chmod +x "${pkgdir}/usr/lib/zen-browser/zen"
  chmod +x "${pkgdir}/usr/lib/zen-browser/zen-bin"

  # Desktop entry
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
Exec=/usr/lib/zen-browser/zen-bin --private-window %u

[Desktop Action profilemanager]
Name=Open the Profile Manager
Exec=/usr/lib/zen-browser/zen-bin --ProfileManager %u' | tee "${pkgdir}/usr/share/applications/zen-browser.desktop" > /dev/null

  # Executable
  mkdir -p "${pkgdir}"/usr/bin
  # shellcheck disable=SC2016
  echo '#!/usr/bin/bash
[[ -z $MOZ_DISABLE_WAYLAND ]] && { [[ $XDG_CURRENT_DESKTOP == "GNOME" ]] && [[ -n $WAYLAND_DISPLAY ]] || [[ $XDG_SESSION_TYPE == "wayland" ]]; } && export MOZ_ENABLE_WAYLAND=1 && export MOZ_DBUS_REMOTE=1
exec /usr/lib/zen-browser/zen-bin "$@"' | tee "${pkgdir}/usr/bin/zen-browser" > /dev/null
  chmod +x "${pkgdir}/usr/bin/zen-browser"

  # Icons
  for i in 16x16 32x32 48x48 64x64 128x128; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${i}/apps/"
    ln -s "/usr/lib/zen-browser/browser/chrome/icons/default/default${i/x*/}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}/apps/zen-browser.png"
  done

  # Policies
  mkdir -p "${pkgdir}/usr/lib/zen-browser/distribution"
  echo '{
    "policies": {
        "DisableAppUpdate": true
    }
}' | tee "${pkgdir}/usr/lib/zen-browser/distribution/policies.json" > /dev/null
}
